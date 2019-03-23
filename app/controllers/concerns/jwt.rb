rsa_private = OpenSSL::PKey::RSA.generate 2048
rsa_public = rsa_private.public_key