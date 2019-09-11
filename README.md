**A Processing project to graph Overwatch SR.**

*This style has the add functionality of showing patterns in a players choice of role. Such as win/loss streaks, periods of 'maining' a role and periods of not playing a role. 

![](output.jpg)

## Usage
The data of the player's SR is to be stored in `/data/sr.txt/`.

*Every time you win, lose, or draw a competitive game, you need to record your new SR in the file.*

#### Formatting
All SR should be recorded separately on new lines in the format `<Role>:<New SR>`. For example, if you played a game as a Platinum *Reaper*, you would append `D:2732` to the file. 

#### Example
```
S:2662
S:2637
S:2661
S:2638
S:2664
S:2646
S:2623
D:2596
D:2568
T:2733
T:2712
T:2693
T:2719
D:2593
D:2613
D:2632
S:2599
S:2626
```

## Updates
* Labels;
* Splitting by competitive seasons.

## Installation
Download [Processing](https://processing.org/), download these project files and open using *Processing*.

*An executable version might be available in another branch in the near future.*
