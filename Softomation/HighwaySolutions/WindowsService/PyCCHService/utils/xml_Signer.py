from lxml import etree
import xmlsec
from cryptography.hazmat.primitives import serialization
import threading


class XmlSigner:
    _lock = threading.Lock()  # Class-level lock for thread safety

    @staticmethod
    def sign_xml_file(xml_string, file_name, private_key, certificate):
        try:
            with XmlSigner._lock:
                parser = etree.XMLParser(remove_blank_text=True)
                doc = etree.fromstring(xml_string, parser)

                # Create the Signature template
                signature_node = xmlsec.template.create(
                    doc,
                    xmlsec.Transform.EXCL_C14N,
                    xmlsec.Transform.RSA_SHA256
                )
                doc.append(signature_node)

                # Add reference and transform
                ref = xmlsec.template.add_reference(
                    signature_node,
                    xmlsec.Transform.SHA256,
                    uri=""
                )
                xmlsec.template.add_transform(ref, xmlsec.Transform.ENVELOPED)

                key_info = xmlsec.template.ensure_key_info(signature_node)
                x509_data = xmlsec.template.add_x509_data(key_info)

                x509_subject_name = certificate.subject.rfc4514_string()
                x509_subject_name_node = xmlsec.template.x509_data_add_subject_name(x509_data)
                x509_subject_name_node.text = x509_subject_name

                x509_certificate_node = xmlsec.template.x509_data_add_certificate(x509_data)
                x509_certificate_node.text = certificate.public_bytes(encoding=serialization.Encoding.DER).hex()

                signing_ctx = xmlsec.SignatureContext()
                signing_ctx.key = xmlsec.Key.from_memory(
                    private_key.private_bytes(
                        encoding=serialization.Encoding.PEM,
                        format=serialization.PrivateFormat.PKCS8,
                        encryption_algorithm=serialization.NoEncryption()
                    ),
                    xmlsec.KeyFormat.PEM
                )

                signing_ctx.key.load_cert_from_memory(
                    certificate.public_bytes(encoding=serialization.Encoding.PEM),
                    xmlsec.KeyFormat.PEM
                )

                signing_ctx.sign(signature_node)

                if isinstance(doc.getroottree().getroot(), etree._ProcessingInstruction):
                    doc.remove(doc.getroottree().getroot())

                with open(file_name, "wb") as signed_file:
                    signed_file.write(etree.tostring(doc, pretty_print=True, xml_declaration=True, encoding="UTF-8"))
                print("XML document signed and saved successfully.")
        except Exception as e:
            raise Exception(f"Error signing XML: {e}")
