# Introduction to Logit

## Learning Objective

In which, we learn the basis of our linear scoring approach.


## Step1 : From Probabilities to Odds

- Without any loss of information, in the binary case, we can express probabilities as simple odds: the ratio of one event to the other.

$$ \frac{p}{1-p} = \frac{P(y=1|x)}{P(y=0|x)} $$

- while probabilities range from 0 to 1, odds range from 0 to infinity.

- moving on we can observe that there's an annoying asymmetry to our odds value.
- 19 to 1 and 1 to 19 really should be related somehow, but they're not obviously -- we have a 19 and a 0.0526 (in odds).

## Step 2 : Odds to Log Odds

- let's take the log of the odds.
- odds is the ratio of the probability of an event being the case to the probability of it not being the case.

$$ \ln(\frac{p}{1-p}) = \ln(\frac{P(y=1|x)}{P(y=0|x)}) $$

- Symmetry!
  - 0.95 = (19 to 1) = 2.944 
  - 0.05 = (1 to 19) = -2.944
- And we've found a way to map probabilities to the real number line.

- while probabilites ranage from 0 to 1, log odds range from -infinity to infinity.

## Logit
- The log of the odds of the probability of an event is called the logit.

$$ logit = \ln(\frac{p}{1-p}) $$

- The scores z from our (wTx) computation are logits. During learning we will be searching for weights w that produce the right scores (logits).

- So now we know how take  a probability and produce its logit. How do we go the other way? Given a logit, produce probability

- so sigmoid is the inverse of the logit function.
