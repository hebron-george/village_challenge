# Intro

My manager sent me an email randomly with the following coding challenge.

# Challenge

Write a program that will generate a simulation of a village that scientists are studying.

In the village, there is a rule that once you have a boy, you can not have any further children.

### So acceptable families are:
* Girl, Girl
* Girl
* Boy
* Girl, Boy
* Girl, Girl, Boy

### However examples of unacceptable families are:
* Boy, Girl
* Boy, Boy
* Girl, Boy, Girl


They also noticed that only 75% of families will want any children at all.

After the first child, families have a 25% chance of having each subsequent child.


**Implement a method that will return a data structure that shows each families children in the village.**

Using this method, calculate the follow.

1. Ratio of boys to girls
2. Avg kids per family
3. Avg boys per family
4. Avg girls per family

```ruby
def simulate_families(number_of_families)

end
```


# Solution

## Assumptions

* Chances of having a boy or girl are the same
* Minimum number of families needed: 10, to make some math easier

Load up `bin/console` and follow along:

```ruby
families = VillageChallenge.simulate_families(100); # remove the semi-colon if you want to see the list of families

# 1. Ratio of boys to girls
VillageChallenge.boys_to_girls(families) # => 0.922077922077922
 
# 2. Average kids per family
VillageChallenge.average_kids_per_family(families) # => 1.48

# 3. Average boys per family
VillageChallenge.average_boys_per_family(families) # => 0.71
 
# 4. Average girls per family 
VillageChallenge.average_girls_per_family(families) # => 0.77
```