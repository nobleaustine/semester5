from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import rsa, padding
from base64 import b64encode, b64decode

def generate_key_pair():
    private_key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048,
        backend=default_backend()
    )
    public_key = private_key.public_key()
    return private_key, public_key

def encrypt(message, public_key):
    ciphertext = public_key.encrypt(
        message.encode(),
        padding.OAEP(
            mgf=padding.MGF1(algorithm=hashes.SHA256()),
            algorithm=hashes.SHA256(),
            label=None
        )
    )
    return b64encode(ciphertext)

def decrypt(ciphertext, private_key):
    decrypted_message = private_key.decrypt(
        b64decode(ciphertext),
        padding.OAEP(
            mgf=padding.MGF1(algorithm=hashes.SHA256()),
            algorithm=hashes.SHA256(),
            label=None
        )
    )
    return decrypted_message.decode()

def main():
    print("      ")
    print("            RSA ALGORITHM")
    private_key, public_key = generate_key_pair()

  
    N = public_key.public_numbers().n
    e = public_key.public_numbers().e

    d = private_key.private_numbers().d
    p = private_key.private_numbers().p
    q = private_key.private_numbers().q


    message = input("Enter the message to be encrypt: ")
    print(f"\nOriginal Message: {message}")
    encrypted_message = encrypt(message, public_key)
    print(f"\nEncrypted Message (as a number): {int.from_bytes(b64decode(encrypted_message), 'big')}")
    
    decrypted_message = decrypt(encrypted_message, private_key)
    print(f"\nDecrypted Message: {decrypted_message}")
    print("      ")

main()