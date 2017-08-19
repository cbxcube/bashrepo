# REGEXP EXAMPLES FOR BASH
#


# 1. comparison operator, represented by =~.
#
# As with other comparison operators (e.g., -lt or ==), bash will return a zero if an expression like $digit =~ "[[0-9]]" shows that the variable on the left matches the expression on the right and a one otherwise. This example test asks whether the value of $digit matches a single digit.
if [[ $digit =~ [0-9] ]]; then
    echo "$digit is a digit"
else
    echo "oops"
fi

# 2. You can also check whether a reply to a prompt is numeric with similar syntax:
echo -n "Your answer> "
read REPLY
if [[ $REPLY =~ ^[0-9]+$ ]]; then
    echo Numeric
else
    echo Non-numeric
fi



# 3. Verify email format:
# we're asking whether the value of our $email variable looks like an email address
#  first expression (the account name) can contain letters, digits and some special characters.
# The + to the right of the first ] means that we can have any number of such characters. We then see the @ sign sitting between the username and the email domain -- and a literal dot (\.) between the primary part of the domain name and the "com", "net", "gov", etc. part. The comparison is then enclosed in double brackets.
if [[ "$email" =~ "^[A-Za-z0-9._%+-]+<b>@</b>[A-Za-z0-9.-]+<b>\.</b>[A-Za-z]{2,4}$" ]]
then
    echo "This email address looks fine: $email"
else
    echo "This email address is flawed: $email"
fi

# 4. Check if IP has proper format
#!/bin/bash
if [ $# != 1 ]; then
    echo "Usage: $0 address"
    exit 1
else
    ip=$1
fi

if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    echo "Looks like an IPv4 IP address"
elif [[ $ip =~ ^[A-Fa-f0-9:]+$ ]]; then
    echo "Could be an IPv6 IP address"
else
    echo "oops"
fi 

# 5. To loop 100 times? Just do something like this:

for n in {1..100}
do
    echo $n
done

# 6. Loop through letters or through various ranges of letters or numbers using expressions such as these. You don't have to start with 1 or a and you can move backwards through the list.
{a..z}
{z..a}
{c..f}
{5..25}
{10..-10}

# 6. to see how these ranges work? You can also just try expanding them with the echo command.
$echo {a..z}
a b c d e f g h i j k l m n o p q r s t u v w x y z
$ echo {5..-1}
5 4 3 2 1 0 -1

