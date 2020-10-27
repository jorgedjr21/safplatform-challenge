# Challenge
 **I used, as input, the file input.txt**

Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

# How to run
 To run the application,  you just need run the following command:

`ruby main.rb`

If you want change the input, edit the file `input.txt`, following the format:

```
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25
```

The available products can be found at: https://gist.github.com/safplatform/792314da6b54346594432f30d5868f36
# Tests

To run the tests, just run the following command:

`rspec spec/classes`
