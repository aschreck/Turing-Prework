
#this program can encrypt and decrypt individual words, input sentences,
#and entire files. These functions can be performed via the IRB, call-commands
#within the text. In addition, one can input a string and a rotation value
#and receive encrypted text back in the terminal. Finally, it can crack
#a standard rotation encryption iteratively. 
class Encryptor
   def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
   end

   def encrypt_letter(letter, rotation)
     cipher_instance = cipher(rotation)
     cipher_instance[letter]
   end

   def encrypt(word, rotation)
     input = word.split("")
     results = input.collect do |char|
       encrypt_letter(char, rotation)
     end
    return results.join
   end

   def file_encrypt(file, rotation)
     #create handle for file and access as text
     input = File.open(file, "r")
     text = input.read

     output = File.new(file + ".encrypted", "w+")
     output.write(encrypt(text, rotation))
     input.close
     output.close
   end
#decrypt section

   def decrypt_cipher(rotation)
     characters = (' '..'z').to_a
     rotated_characters = characters.rotate(rotation)
     Hash[rotated_characters.zip(characters)]
   end

   def decrypt_letter(letter, rotation)
     cipher_instance = decrypt_cipher(rotation)
     cipher_instance[letter]
   end

   def decrypt(word, rotation)
     input = word.split("")
     results = input.collect do |char|
       decrypt_letter(char, rotation)
     end
     return results.join
   end

   def file_decrypt(file, rotation)
     input = File.open(file, "r")
     text = input.read
     output = File.new(file + ".decrypted", "w+")
     output.write(decrypt(text, rotation))
     input.close
     output.close
   end

   def code_cracker(text)

     output = File.new("decrypt_spread", "w")
     i = 1
     while i < 91
       output.write("\n  " + i.to_s + ") ")
       output.write(decrypt(text, i))
       i += 1
     end
     output.close
   end
end
e = Encryptor.new()
unencrypted_message, rotation = ARGV
puts e.encrypt(unencrypted_message, rotation.to_i)




#e.encrypt("fnhfntr")
