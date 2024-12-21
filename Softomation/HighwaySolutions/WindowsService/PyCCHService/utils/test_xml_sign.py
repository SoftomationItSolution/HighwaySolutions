import xmlsec
from lxml import etree
from cryptography.hazmat.primitives.serialization import load_pem_private_key
from cryptography.x509 import load_pem_x509_certificate
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization
class XmlSigner1:
    def __init__(self, certificate_path, private_key_password):
        self.certificate_path = certificate_path
        self.private_key_password = private_key_password.encode()

    def sign_xml_string(self, xml_content, signed_file_name):
        # Parse the XML content from string
        doc = etree.fromstring(xml_content)

        # Create a digital signature template
        signature_node = xmlsec.template.create(  
            doc, xmlsec.Transform.ENVELOPED, xmlsec.Transform.RSA_SHA256
        )

        # Append the signature node to the document root
        doc.append(signature_node)

        # Add reference to the signature
        ref = xmlsec.template.add_reference(
            signature_node, xmlsec.Transform.SHA256, uri=""  # empty for whole doc
        )

        xmlsec.template.add_transform(ref, xmlsec.Transform.ENVELOPED)

        # Add KeyInfo node
        key_info = xmlsec.template.ensure_key_info(signature_node)
        xmlsec.template.add_x509_data(key_info)

        # Load certificate and private key
        with open(self.certificate_path, "rb") as cert_file:
            cert_data = cert_file.read()

        cert = load_pem_x509_certificate(cert_data, default_backend())
        private_key = load_pem_private_key(cert_data, self.private_key_password, default_backend())

        # Create a signing context
        sign_ctx = xmlsec.SignatureContext()

        # Attach key to the context
        sign_ctx.key = xmlsec.Key.from_memory(
            private_key.private_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PrivateFormat.PKCS8,
                encryption_algorithm=serialization.NoEncryption(),
            ),
            xmlsec.KeyDataFormat.PEM,
        )

        # Add certificate to the key
        sign_ctx.key.load_cert(cert.public_bytes(serialization.Encoding.PEM), xmlsec.KeyDataFormat.PEM)

        # Sign the document
        sign_ctx.sign(signature_node)

        # Save the signed document
        with open(signed_file_name, "wb") as signed_file:
            signed_file.write(etree.tostring(doc, pretty_print=True, xml_declaration=True, encoding="UTF-8"))


class XmlSigner:
    def __init__(self, certificate_path, private_key_password):
        self.certificate_path = certificate_path
        self.private_key_password = private_key_password.encode()

    def sign_xml_string(self, xml_content, signed_file_name):
        # Parse the XML content from string
        doc = etree.fromstring(xml_content)

        # Create a digital signature template
        signature_node = xmlsec.template.create(  
            doc, xmlsec.Transform.ENVELOPED, xmlsec.Transform.RSA_SHA256
        )

        # Append the signature node to the document root
        doc.append(signature_node)

        # Add reference to the signature
        ref = xmlsec.template.add_reference(
            signature_node, xmlsec.Transform.SHA256, uri=""  # empty for whole doc
        )

        xmlsec.template.add_transform(ref, xmlsec.Transform.ENVELOPED)

        # Add KeyInfo node
        key_info = xmlsec.template.ensure_key_info(signature_node)
        xmlsec.template.add_x509_data(key_info)

        # Load certificate and private key
        with open(self.certificate_path, "rb") as cert_file:
            cert_data = cert_file.read()

        cert = load_pem_x509_certificate(cert_data, default_backend())
        private_key = load_pem_private_key(cert_data, self.private_key_password, default_backend())

        # Create a signing context
        sign_ctx = xmlsec.SignatureContext()

        # Attach key to the context
        sign_ctx.key = xmlsec.Key.from_memory(
            private_key.private_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PrivateFormat.PKCS8,
                encryption_algorithm=serialization.NoEncryption(),
            ),
            xmlsec.KeyDataFormat.PEM,
        )

        # Add certificate to the key
        sign_ctx.key.load_cert(cert.public_bytes(serialization.Encoding.PEM), xmlsec.KeyDataFormat.PEM)

        # Sign the document
        sign_ctx.sign(signature_node)

        # Save the signed document
        with open(signed_file_name, "wb") as signed_file:
            signed_file.write(etree.tostring(doc, pretty_print=True, xml_declaration=True, encoding="UTF-8"))


class XmlSigner_no_password:
        
    def sign_xml_string(self, xml_content, certificate_path,signed_file_name):
        # Parse the XML content from string
        doc = etree.fromstring(xml_content)

        # Create a digital signature template
        signature_node = xmlsec.template.create(  
            doc, xmlsec.Transform.ENVELOPED, xmlsec.Transform.RSA_SHA256
        )

        # Append the signature node to the document root
        doc.append(signature_node)

        # Add reference to the signature
        ref = xmlsec.template.add_reference(
            signature_node, xmlsec.Transform.SHA256, uri=""  # empty for whole doc
        )

        xmlsec.template.add_transform(ref, xmlsec.Transform.ENVELOPED)

        # Add KeyInfo node
        key_info = xmlsec.template.ensure_key_info(signature_node)
        xmlsec.template.add_x509_data(key_info)

        # Load certificate and private key
        with open(certificate_path, "rb") as cert_file:
            cert_data = cert_file.read()

        # Separate certificate and private key if they are in the same file
        cert = load_pem_x509_certificate(cert_data, default_backend())

        # If private key is in a different file, specify its path
        private_key_path = "/path/to/private_key.pem"  # Specify the correct path to your private key file
        with open(private_key_path, "rb") as private_key_file:
            private_key_data = private_key_file.read()

        private_key = load_pem_private_key(private_key_data, password=None, backend=default_backend())

        # Create a signing context
        sign_ctx = xmlsec.SignatureContext()

        # Attach key to the context
        sign_ctx.key = xmlsec.Key.from_memory(
            private_key.private_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PrivateFormat.PKCS8,
                encryption_algorithm=serialization.NoEncryption(),
            ),
            xmlsec.KeyDataFormat.PEM,
        )

        # Add certificate to the key
        sign_ctx.key.load_cert(cert.public_bytes(serialization.Encoding.PEM), xmlsec.KeyDataFormat.PEM)

        # Sign the document
        sign_ctx.sign(signature_node)

        # Save the signed document
        with open(signed_file_name, "wb") as signed_file:
            signed_file.write(etree.tostring(doc, pretty_print=True, xml_declaration=True, encoding="UTF-8"))


# Usage example
# signer = XmlSigner("path/to/certificate.pem", "private_key_password")
# xml_content = "<root><data>Example</data></root>"
# signer.sign_xml_string(xml_content, "signed_output.xml")
