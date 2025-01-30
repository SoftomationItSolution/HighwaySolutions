import base64
from Crypto.Cipher import AES
from Crypto.Hash import HMAC, SHA256
from Crypto.Random import get_random_bytes
from Crypto.Protocol.KDF import PBKDF2
import json


class Aes256CbcEncrypter:

    @staticmethod
    def encrypt(content, key):
        try:
            key = key.encode('utf-8')
            key = key.ljust(32, b'\0')[:32]  # Ensuring key is 32 bytes long
            iv = key[:16]  # First 16 bytes of the key are used as IV

            # Convert content to bytes
            plain_text_bytes = content.encode('utf-8')

            cipher = AES.new(key, AES.MODE_CBC, iv)
            # Padding to ensure the plaintext length is a multiple of block size (16)
            padding_length = 16 - len(plain_text_bytes) % 16
            plain_text_bytes += bytes([padding_length]) * padding_length

            cipher_text_bytes = cipher.encrypt(plain_text_bytes)

            return base64.b64encode(cipher_text_bytes).decode('utf-8')
        except Exception as e:
            print(f"Error encrypting: {e}")
            return ""

    @staticmethod
    def decrypt(content, key):
        try:
            key = key.encode('utf-8')
            key = key.ljust(32, b'\0')[:32]  # Ensure key is 32 bytes long
            iv = key[:16]  # First 16 bytes of the key are used as IV

            cipher_text_bytes = base64.b64decode(content)

            cipher = AES.new(key, AES.MODE_CBC, iv)
            plain_text_bytes = cipher.decrypt(cipher_text_bytes)

            # Remove padding
            padding_length = plain_text_bytes[-1]
            plain_text_bytes = plain_text_bytes[:-padding_length]

            return plain_text_bytes.decode('utf-8')
        except Exception as e:
            print(f"Error decrypting: {e}")
            return ""

    @staticmethod
    def encrypt1(plain_text, key):
        try:
            key = key.encode('utf-8')
            key = key.ljust(32, b'\0')[:32]  # Ensure key is 32 bytes long

            # Generate IV
            iv = get_random_bytes(16)

            cipher = AES.new(key, AES.MODE_CBC, iv)
            # Padding to ensure the plaintext length is a multiple of block size (16)
            padding_length = 16 - len(plain_text) % 16
            plain_text_bytes = plain_text.encode('utf-8') + bytes([padding_length]) * padding_length

            cipher_text_bytes = cipher.encrypt(plain_text_bytes)
            encrypted_text = base64.b64encode(cipher_text_bytes).decode('utf-8')

            # Generate MAC using HMAC SHA-256
            mac = Aes256CbcEncrypter.hmac_sha256(f"{base64.b64encode(iv).decode('utf-8')}{encrypted_text}", key)

            # Create dictionary and serialize it to JSON
            key_values = {
                "iv": base64.b64encode(iv).decode('utf-8'),
                "value": encrypted_text,
                "mac": mac
            }

            return base64.b64encode(json.dumps(key_values).encode('utf-8')).decode('utf-8')
        except Exception as e:
            print(f"Error encrypting1: {e}")
            return ""

    @staticmethod
    def decrypt2(plain_text, key):
        try:
            key = key.encode('utf-8')
            key = key.ljust(32, b'\0')[:32]  # Ensure key is 32 bytes long

            # Decode the base64 string
            base64_decoded = base64.b64decode(plain_text)
            decoded_str = base64_decoded.decode('utf-8')

            # Parse the JSON content
            payload = json.loads(decoded_str)

            iv = base64.b64decode(payload["iv"])
            encrypted_text = payload["value"]
            cipher = AES.new(key, AES.MODE_CBC, iv)

            cipher_text_bytes = base64.b64decode(encrypted_text)
            plain_text_bytes = cipher.decrypt(cipher_text_bytes)

            # Remove padding
            padding_length = plain_text_bytes[-1]
            plain_text_bytes = plain_text_bytes[:-padding_length]

            return plain_text_bytes.decode('utf-8')
        except Exception as e:
            print(f"Error decrypting2: {e}")
            return ""

    @staticmethod
    def hmac_sha256(data, key):
        try:
            hmac_obj = HMAC.new(key.encode('utf-8'), data.encode('utf-8'), SHA256)
            return hmac_obj.hexdigest()
        except Exception as e:
            print(f"Error in HMAC SHA256: {e}")
            return ""


# Example usage:
# key = "your-encryption-key-256-bits"
# content = "This is a secret message."

# encrypted = Aes256CbcEncrypter.encrypt(content, key)
# print(f"Encrypted: {encrypted}")

# decrypted = Aes256CbcEncrypter.decrypt(encrypted, key)
# print(f"Decrypted: {decrypted}")

# # Encrypting and decrypting with additional data (IV and MAC)
# encrypted1 = Aes256CbcEncrypter.encrypt1(content, key)
# print(f"Encrypted1: {encrypted1}")

# decrypted2 = Aes256CbcEncrypter.decrypt2(encrypted1, key)
# print(f"Decrypted2: {decrypted2}")
