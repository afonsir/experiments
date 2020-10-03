if (0 == true, "0 is equal to true" println, "0 isn't equal to true" println)    # => false
if (0 == false, "0 is equal to false" println, "0 isn't equal to false" println) # => false

if ("" == true, "Empty String is equal to true" println, "Empty String isn't equal to true" println)    # => false
if ("" == false, "Empty String is equal to false" println, "Empty String isn't equal to false" println) # => false

if (nil == true, "Nil is equal to true" println, "Nil isn't equal to true" println)    # => false
if (nil == false, "Nil is equal to false" println, "Nil isn't equal to false" println) # => false
