# -*- encoding: utf-8 -*-
import glob
import os, random, struct, sys
from Cryptodome.Cipher import AES
def decrypt_file(key, in_filename, out_filename=None, chunksize=24 * 1024):

    if not out_filename:
        out_filename = os.path.splitext(in_filename)[0]

    with open(in_filename, 'rb') as infile:
        origsize = struct.unpack('<Q', infile.read(struct.calcsize('Q')))[0]
        iv = infile.read(16)
        decryptor = AES.new(key, AES.MODE_CBC, iv)

        with open(out_filename, 'wb') as outfile:
            while True:
                chunk = infile.read(chunksize)
                if len(chunk) == 0:
                    break
                outfile.write(decryptor.decrypt(chunk))

            outfile.truncate(origsize)

startPath = sys.argv[1] #경로
input_key = sys.argv[2].encode("UTF-8") #암호키
extension = sys.argv[3].encode("UTF-8") #확장자
key = bytearray(16)
key1 = input_key[0:16]
i=0
for value in key1:
    key[i] += value
    i += 1
extension = extension.decode("UTF-8")

# Decrypts the files
for filename in glob.iglob(startPath, recursive=True):
    if (os.path.isfile(filename)):
        fname, ext = os.path.splitext(filename)
        if (ext == '.'+ extension):
            print('Decrypting> ' + filename)
            decrypt_file(key, filename)
            os.remove(filename)
