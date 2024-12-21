from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.backends import default_backend

# Assume `certificate_pem` contains the certificate in PEM format as a string
certificate_pem = """
-----BEGIN CERTIFICATE-----
... (certificate content) ...
-----END CERTIFICATE-----
"""

# Load the certificate
from cryptography import x509
certificate = x509.load_pem_x509_certificate(certificate_pem.encode(), default_backend())

public_key = certificate.public_key()

public_key_pem = public_key.public_bytes(encoding=serialization.Encoding.PEM,format=serialization.PublicFormat.SubjectPublicKeyInfo)

print(public_key_pem.decode())
