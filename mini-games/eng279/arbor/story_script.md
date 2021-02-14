# Story Script

[TOC]

## Topics

* hedgehog dilemma

***

### Init - Warning

### Variables

* $change

WARNING: Story contains mild violence, drugs, racism, sexism and depressing topics.

***

### intro-1

Your life has been dull for the past 17 years. There seems to be no signs of change and you seem to care about nothing. Life seems to be binding you from pursuing anything in life. You have no dreams, no hopes and the future to you is something you never thought of. 

The [chaotic nature of your house](####chaotic-house), [your dull life](####dull-life), and your [dull town](####dull-town) makes you wonder what is the point of life.

Life is not fair, it's not meant to be. Life is dull you thought to yourself. You hang by the bridge looking at [the distant](###distant)|[the river below you](###bottom). Perhaps it is better to not have feelings or never have existed before.

***

### distant

Thinking to yourself why me. Why is everything so monotone. How can I change my life? Long and behold, the sun rises and I thought came to you, how about I change this pathetically dull and lonely life of mine.

***[$change++]***

[next](##name)

### bottom
Would life be better without me? Life seems so apathetic. You are filled with great feeling of loneliness, grief, and despair. As you mourn about your pathetic life, the sky seems to have gotten much brighter. Is it already sunrise already you thought to yourself. The warm rays of the sun rising above the horizon comforts you and gives you some hope about life. But hope of what? That is what you are to find out.

[next](##name)

***

#### chaotic-house

Living in a dysfunctional family, you never got along with anyone in your family. You always felt lonely, emotionally abused and the physical abuse from both your classmates and family made you seal your emotions for the most part. 

[back](#intro-1)

#### dull-life

With no ambitions, you have nothing to look forward to in life. You wake up each day not knowing why you are living. You live just to see another day without having a goal. What's the meaning of life. Surely it's not 42 is it?

[back](#intro-1)

#### dull-town

Due to long family complications, your parents have filed for divorce and you are now living with your mother back to her hometown. A much bigger town but a town nonetheless with nothing particularly interesting to see.

[back](#intro-1)

## name

### Variables

* $name

***

**Enter your name:**

## class-intro
***

You are a male

[with no ambitions and no accomplishments to boast about](##class-intro-1)

or

[who likes to listen to indie music and you look forward to spend your time with your new classmates](##class-intro-2)

### class-intro-1

[no ambitions and no accomplishments to boast about]
The name is $name. A 15 years old male with no ambitions and no accomplishments to boast about. Other than listening to indie music, I have no other interest is how you introduced yourself to an unfamiliar class.



Your introduction seemed to put off the students in the class as a gloomy person, but you did not seem to care. Not a great start to change your gloomy and pathetic life $name. Put in some effort is what you tell yourself.

[next](##class-intro-lunch)

### class-intro-2

The name is $name. A 17 years old male who likes to listen to indie music and I look forward to spend time with everyone.

You gave a short and simple introduction. Not bad considering how negative you are.

***[$change++]***

[next](##class-intro-lunch)

## class-intro-lunch
The bell rings, signalling that it's lunch break. The curious students crowd over you to ask you questions. You think of this situation as a:

[nuisance](#### nuisance)
[an opportunity to make new friends and learn about the city](####opportunity)
You try to answer the questions of your new classmates as earnestly and enthusiastically as you can. But in the back of your mind, you cannot help but think to yourself how apathetic you are and the situation seems overwhelming to an anti-social human being. Your attempts to introduce yourself to your new classmates came out as awkward but no hard feelings were hurt.

#### nuisance

Why are there so many humans in this world. So many flies around you buzzing around making you frustrated. Why can't the world around me just die off. Such negative thoughts are clouding in your mind as you try to deal with your new environment. You give cold and rude responses to the students around you who are trying to get to know you. Remember kid, first impression is important and you just ruin your chances like usual.

***[insert delay]***

Your poor introduction and rude first impression has made you isolated from the class. No one wants to approach you and you feel lonely but nothing has changed from your previous school. Life is the same as usual, being a loner and a outcast.

[next](##day-2)

#### opportunity

You try to answer the questions of your new classmates as earnestly and enthusiastically as you can. But in the back of your mind, you cannot help but think to yourself how apathetic you are and the situation seems overwhelming to an anti-social human being. Your attempts to introduce yourself to your new classmates came out as awkward but no hard feelings were hurt.

***[$change++]***

[next](##day-1)

## day-1

Few Days Later



It's lunch time but having no friends and not feeling hungry, you take a stroll around the campus. In the back of the school building, you see your fellow classmate being harassed for being different. Very unusual to see a human with different skin colour in these parts of the country is what you thought to yourself. The harassment seems to be getting more intense. You

[ignore your classmate. You don't want to involve yourself to such troublesome situation](#### ignore)

[intervene and tell the bullies to stop. It's not right to beat people who are different from you](####intervene)

However, you have gained respect from your classmate but you never noticed. You just stood for what you believed in and did not care about gaining the trust of your classmate.

#### ignore

The bullies catch your presence and threatens to beat you up. You reassure them that you will not report their harassment to the authorities and in fact, you tell them your fellow classmate is disgusting and should go back to their home country. You safely avoid being beaten and seem to have gained the respect of the bullies.

[next](##day-2)

#### intervene

Your intervention provokes the bullies and they beat you up. But you at least stood for what you believed in. Your face is bruised and the bullies spread false rumours about you. Life isn't fair. Justice only comes to those with enough power is what you thought to yourself. You brush away those false accusations from your mind. You are used to being called names and being accused of things you never done in your previous school. So it's no different this time.

***[insert delay]***

However, you have gained respect from your classmate but you never noticed. You just stood for what you believed in and did not care about gaining the trust of your classmate.

***[$change++]***

[next](##day-2)

***

## day-2

### Variables

$text = "You smoke the cigarette first. As you inhale the cigarette, you start coughing. The bullies had a good laugh and ask for your name. You spend the entire afternoon chilling with the bullies and getting high. You forget the time and the entire afternoon class."

***

The next day

The bell rings and it's lunch break. Having no friends, you decide to stroll around the campus again. You encounter the bullies in the back of the gym having a good time. There is a strong stench coming from them. You recognise the smell. It's weed. The bullies notice you and calls you over. You come over reluctantly being afraid of being beaten like your fellow classmate the other day.

**if ($ignore)** {
To much of your surprise, they invite you to smoke some cigarettes and weed with them.

[You accept their invitation](####accept)

[You deny their invitation](####reject)

**}**

**else {**
Not much of a surprise to you, they start harassing you with names and shove you around. However, this treatment is no different from home. Your family calls you names, your siblings push you around. You tell yourself, I am strong and try to keep yourself cool. You manage to leave without any serious bruises.

[next](###day-2-reject)

**}**

#### accept

Feeling down, peer-pressured and depressed as usual, you tell yourself to try something new and accept the invitation from the bullies. 

$text

[next](###day-2-smoke)

#### reject

The bullies seems to be irritated from your response and try to pressure you to smoke. [Do you cave into their peer pressure](#### accept) or [do you continue to reject their invitation knowing full well that is probably not a good idea to smoke in school and also that it's not good for your health to smoke cigarettes](####reject-2). 

#### reject-2

The bullies stand up and starts to call you a wuss. You slowly back off and keep your cool. You tell yourself, nothing has changed. You have always been called a wuss, a failure, and an incompetent brat by the humans around you.

[next](###day-2-reject)

### day-2-smoke
Your parents are notified of your delinquent behaviours but they don't seem to care at all (as expected). You manage to skip class (hooray!) and have a good time with the delinquents smoking and getting high. Your class notice this behaviour and seem to be more afraid of you.

[next](##club-day)

### day-2-reject

Lunch break ends and you return to class. Having been near the delinquents, you reek of weed and cigarettes. You are told by your teacher to stand outside of the classroom and gives you a serious scolding. The class looks down on you and associate you with the delinquents. No one wants association with you.

**if not $ignore {**

***[insert delay]***

Except for one classmate. The classmate whom you tried to save from the bullies the other day.

***[$change++]***

**}**

[next](##club-day)

## club-day

### Variables

$text = "You find yourself in a back alley with your newfound friends. Although you failed to join into a club, you find yourself feeling happy with your new companions. You no longer feel lonely and continue to have fun skipping class, smoking, and drinking. You break your curfew. As usual, your mother is too busy with her work and life to even care about you."

$pastime_delinquency = 1

$pastime_dull = 2

$pastime_club= 3

**$path =**

1. delinquency pastime
2. dull pastime
3. club pastime 

***

It's clubs day, a day where clubs set up booths all over the campus before school, at lunch time, and after school trying to recruit new members. Clubs require at least 3 students to remain operational and receive funding from the school.

Having no friends and a poor reputation, no one in your class comes to you for recruitment. So you decide to take a stroll around the campus to see what clubs are available. You want to change your life and decided to try joining a club for the first time in your life.

[next](### club-day-2)

### club-day-2

All the clubs seem boring and dull to you. You want to change your life, but you cannot seem to take the first step. You know clubs are a great way to change oneself, meet new humans, and be away from your chaotic household.

During your walk around the campus, you found yourself wandering to the back of the gym where there are no club booths. You find the student who was bullied the day before being bullied again like usual for being different. The bullies notice you and calls you over.

**if $ignore {**

The bullies are having a fun time relieving their stress onto the student and take turns being high. They ask you again if you wish to smoke with them. You

[accept the invitation](####club-day-smoke)

[reject their invitation](###club-day-reject)

**}**

**else {**

You don't seem to care about the student being bullied. However, you decide to intervene again because it violates your moral principles. Once again you get pushed around and beaten. You reek of cigarettes and weed from the bullies. Being weak from the beatings, the *student* helps you walk to the infirmary to patch your wounds. The student invites you to help them form a new club. You reluctantly agree to the student's request being tired from the beatings. You already went around all the clubs and nothing seemed to interest you, so you saw no reason not to agree with the student's request. You seem very disinterested but the student was very happy with your response.

***[set $path=pastime_club]***

***[$change++]***

[next](##pastime)

**}**

#### club-day-smoke

$text

***[set $path=pastime_delinquency]***

[next](##pastime)

### club-day-reject

You recall the scolding and the looks from your classmate the previous day and decide to reject. The bullies do seem irritated but they seemed to have more fun pushing your classmate around, so they let you off the hook.

***[$change++]***

***[set $path = pastime_dull]***

[next](##pastime)

***

## pastime

### Variables

$text_delinquency = "You spend time out with your newfound friends and spend your days in delinquency. Smoking, partying, and have fun bullying the student your group of friends always bully. Always skipping class after lunch, not doing homework, and always come home past 12am. With your new lifestyle, you feel a sense of security and dominance. The loneliness still lingers but you shrug it off."



$text_dull = "Having no friends as usual, the loneliness constantly taunts you. With no pastime after school, you come home after each school day only to be hurled with insults from your older siblings on how worthless your existence is and shove you around"



$text_club  = "After reluctantly accepting your fellow classmates offer, you spend your time idling in the clubroom after school with others who have joined the club. You along with the classmate have tried hard searching wide and deep into the school to recruit members to your newfound club. The time you spent in the club has made you feel less lonely and much more happier."

$text_club2  = "You start to crack poorly constructed jokes and laugh with your friends. As time passes, you become much closer to those in the club, especially with the club president, the student who invited you to the club. Classmates have started to notice a change in you and even your mother who neglects you has noticed the change."

***

if ($path_delinquency) {

$text_delinquency

}

else if ($path_dull) {

$text_dull

}

else {

$text_club

***[insert delay]***

$text_club2

}

[next](##mother)

***

## mother

### Variables



***

After a nasty divorce with no child support, your mother has been working long hours at work to support the family that she never bothered to care for. Moving back to her hometown has drastically improved her mood but the divorce has caused shame to her parents.

Having divorced the man she once loved did improve her emotional state. Soon after $name was born, a [great financial crisis in Asia](https://en.wikipedia.org/wiki/1997_Asian_financial_crisis) has affected the livelihood of the family. No longer having a job, the man she once loved has became depressed and went into gambling and drinking. After the economy recovered, the man found a job that helped alleviate the poor conditions the family had to live through during the financial crisis. However, that did not change the man's gambling and drinking addiction. Often being drunk after work, the man would  often hurl insults and beat the children and the wife. It was an abusive relationship that broke the wife.

[next](##mother-2)

***

## mother-2

The wife being constantly abused emotionally and physically broke down and started to neglect her children who would often go hungry and beaten. Being a housewife with no work experience, she had no financial independence and so was never able to leave. 

Being proposed during her bachelor years in University, she never finished her degree. Not having a degree made her ineligible for any high paying job nor office work. The country values education so having a University degree was the requirement for any white collar job. 

However, much later in their marriage life, the husband started to cheat on his wife and would often come home late. Taking this opportunity, the wife would work at a convenience store from the morning after her husband leaves for work till the afternoon to avoid being caught. Having saved enough money, she was able to file for divorce.

[next](##mother-3)

***

## mother-3

Living in a nation where income disparity is large and tips are not a practice, the financial situation of the family was in dire situation. Working from early mornings to late nights for 6 days a week was barely enough to cover the household finance. Hence, the mother would often neglect her children even after the nasty divorce. After years of neglection and weariness from work, she could not muster much energy to mend the broken ties she has with her children.

***[insert delay]***

However, she did attempt to recover her relationship with her kids but it was hard.

[next](mother-4)

***

## mother-4

if ($path_delinquency) {

However, you were too busy spending your time in delinquency and neglected to come home often. [Missing all the little *remaining time* you had with your Mother.](##mother-death)

}

else if ($path_dull) {

Being home all the time after school, your Mother would sometimes try to talk to you.

[You would push her away](###mother-5)



[You would talk with her](###mother-6)

}

else {

Noticing your change in attitude, your Mother became curious about your new found life. Having a change of heart, you and your mother tried to mend your broken relationship. Although painful, awkward, and slow at first, you become close with your Mother. You would often talk about your life at the club you joined and especially about the classmate who invited you to the club.

Looking back, those days were probably the most happiest moments in your life since you were born. Not only have you made friends, you also mend your relationship with your Mother. You now have a goal and a dream to look forward to. You no longer wake up each morning questioning why you still live and no longer dread at night about the loneliness in your life and how life seemed unfair.  

***[insert delay]***

***[$change++]***

However, those days did not last long [...](## mother-death)

}

### mother-5

Being so mad at the world around you, about your broken family, the constant beatings from the bullies at school and by your siblings, you closed yourself from others. After never being treated fairly nor with love by your mother, you never saw the point of mending your relationship with your Mother. You would just scream at her and lock yourself in your room.

Looking back in the past, you regret your actions. You regret the opportunity you had to start a new life with your Mother, the regret of not being able to have a mother-child relationship tears you apart. The regret of not being able to understand the pain your Mother went through in her marriage.

[next](####mother-death)

### mother-6

Being frustrated with the world and feeling very lonely at school, you would often express them to your exhausted mother. Your mother says few words but would always and be patient with her child. Your relationship with your Mother improves at the displeasure of your siblings who blames you for causing the family to be torn apart (even though you did nothing).

***[$change++]***

Although lonely, you were glad you had the opportunity to create a short but loving bond with your Mother [who had very little time in her life](mother-death)

***

## mother-death

All life has an end on Earth. No matter how happy nor sad one may be, a life is extinguished every second the passes on Earth. Tic ... *a second passes*, another life has extinguished. Humans often think they'll live a long life but that is never guaranteed. Life is unpredictable. You may be alive today but fade away the day after. A poet once quipped that life is like a bright firework that sparks the sky with its wondrous colours. A beauty when bloomed but is short lived.



[next](##mother-death-2)

***

## mother-death-2

When the news came from the doctor that my mother has passed away, many emotions flowed over me. I'm told she overworked herself and died from a heart attack at work. I wanted my life to change when I entered this town. I wanted to break free from the chains that were bringing me down. Indeed my life changed, but not in the way I wanted it to be ...

if ($mother_rel) {

I wanted to spend more time with mother. We never got along till just recently. So little time. I am now alone. My heart aches, feelings that I thought I did not have have surface from my face. Drops of tears rain down through my face. What is the point of love when it's just snatched away from me. All I have within me are regrets and sadness. Regrets of being powerless, regrets of not defending my mother from my abusive father, and regrets of not trying to mend my relationship with my mother.

}

else {

What a useless mother I have. Cannot even held on till I become an adult. A weak and powerless human she was. Unable to defend herself, unable to gain a comfortable life, and always sad.

}

## post_death

I never once got along with my siblings nor do I ever want to. All they do is hurl insults and beat me. With no adult to depend on, I need to think of what is next. The thought of living with my abusive father again scared me. I thought I was used to the pain but living a life without that wretch father has made me become spoiled and weak. The thought of returning to the **more dull** town and **more abusive** lifestyle made me become more anxious as the time passes. I need to find a new home quickly is what I thought to myself. Life as a minor is harsh. No workplace is willing to hire a minor without a guardian consent. 

if (\$path != $path_club)

​    if (not $mother_rel) {

Without the financial independence, I'll be the same as my Mother, beaten and broken. Lying dead without any accomplishments. Dying pitifully out of exhaustion from work. I can't be a useless and weak human like she was.

​     }

***[insert delay]***

How to earn money quickly? I need to leave from this hellish home of mine. I was desperate. The abuse from my siblings only got more harsher as the time passes. I heard the delinquents in my school have been contracted by the local Yakuza to distribute drugs and find potential females to human traffic.

[Join the Yakuza](bad_route)

}

else if (\$path == \$path_club) {

I fall into the depth of despair due to the loss of my Mother along with the fact that I have to live with my abusive father when I just managed to change my life. The thought of leaving my life in this town I came to like, my classmates, and the first friend I ever made in my life made me be filled with grief. What was the point of all the effort I have put in to change my life to have it be snatched away from me. Everything was for nought. Being unable to sleep due to the immense grief and anxiety of my life after I leave this town, I decide to take a stroll to the bridge where I decided to change my destiny just to see the [sunrise one last time.](##good_route)

}

***

## good-route

Looking at the sunrise once more in the bridge was a gloom moment. I started to reflect the few months of my life in this town, I started to reminisce all the fun I had with the club and with my Mother. It was brief but it sure was the best moments of my life. I wonder if there was anyway to protect the life I had, to spend more time in the town I came to love. The fun time during club activities, my walks back home with my classmate whom I come to know very well after our encounter in the back of the school. All the hassle yet fun times establishing a new club, talk about music and literature with the classmate, the study sessions we had together, and the surprise party we held for my mother. The raindrops wouldn't stop falling. I told myself I wanted to leave the town smiling to not worry classmate and the rest of the members from the *literature* club. I wanted to talk with *classmate* more, I wanted to thank *her* for all the fun I had even if it was momentary and pointless. I just wanted to spend my entire life in this town with *her*. My sadness slowly shifts to gratefulness. Although life may be sad, perhaps sadness is a prerequisite to know what happiness is.

Although it may be a bit early, I decided to call *her*. The first ~~human~~ friend who made me genuinely happy for the first time in my life, the dearest friend who has given me a life to look forward to, a place where I feel comfortable and safe, the friend whom I wanted to thank. I am reminded of the quote of the nameless classmate from *Yamauchi Sakura in Living With Death*

``` 
 And now I find a new belief.
 I was born to meet her.
 All the choices, I’ve made in life were for one purpose: to meet her.
 I have no doubts.
 I know it must be true, because nothing has ever brought me this much joy or this much pain.
```


****[ring] ****

### good-route-2

****[ring] ****

****[ring] ****

A yawning voice comes out of the speaker, "Hello? What's up?"

Being emotional, my voice quavers. I never once realized how hard it is to control your emotions before I came to this town. These emotions may seem to have weaken me but I have no regrets opening my heart to others. However, being unable to speak, I never seemed to be able to converse my feelings of gratefulness. Being so shaky and filled with tears, [*Sakura* decides to meet me in the club room and hear my story.](###good-route-3)

### good-route-3

A decade has pass and I still am living in the small town that I had come to like during my first few months of my highschool career. The town has changed significantly, but my feelings for the town and the sunrise at the bridge never changes. After talking with Sakura, my closest friend for life, it was decided that I would live with her family. My father was just glad to get rid of me and quickly agreed with this arrangement. Rummaging through my mother's belongings, I found a letter written to the 18 year old $name. My mother has written a letter that she meant to give to me when I became an adult but was never able to do so.

[read letter](##letter)

***

## bad_route

Having no way of becoming financially independent fast, you run away on the day your abusive father came to pick up the children and enlist to the local Yakuza gang with the help of the delinquents from school. You spend your days as a lackey to those who terrorize the town, beating those in debt, ruining the lives of families and friends through drugs and human trafficking. However, your days in the Yakuza cuts short when the police cracked down all the syndicates in the area after a big turf war between rival gangs has caused lots of damages in the public. Being arrested, you were sent to 15 years in prison with no hopes of parole. At least that was how long your fellow brothers in arms were locked up. However, you were still a helpless 17 year old kid, a minor, so you were sent to a Juvenile detention centre for 3 years and serve your remaining 2 years in regular prison. 

Juvenile detention centre is not a nice place to be in. Fights would often start and bullying was a norm for the weak. You had to act tough to survive in prison, there was no way you can show any weakness to others.

In your 20th birthday, a letter is sent to you from your family. It seems like it was written by 

if (not $mother_rel) {

that worthless mother of yours

}

your mother to the 18 years old self but was only sent after your siblings found it during spring cleaning recently when they were going through the belongings of their deceased mother.

}

[read the letter](##letter)

***

## letter

[After leaving your father, I started to reflect about my life, my relationship with my children and what went wrong in my life. To start off, it was ALL YOUR FAULT] for causing my marriage life to fail was my initial thought as you were growing up. However, it's not your fault. I and your father are the cause of this family to break down. We failed to be good parents, to raise you and your siblings with love. I turned my head away when your father started to be depressed after he lost his job. I was broken and powerless when your father became mad. I'm sorry for not protecting you and your siblings. I know all the hardships you have went through. I just wanted the beatings and verbal abuse to stop, so I turned my eyes away from my children.]

I was quite surprised when you started to come home smiling. I thought this was the perfect opportunity to redeem myself as a mother and spend more time with you and your siblings. It was hard at first but I'm glad I did. Although I neglected you for 15 years of your life, I want you to know that I love you. I just was weak. I hope you get along with Sakura and your friends from your club. They all seem to be quite nice friends you are. It was fun talking with your friends and celebrating my birthday. We haven't celebrated a birthday ever since you were born. It brought tear to my heart to know that you would be fine without me.

I never told you nor any of your siblings, but I don't have much time left. I was diagnose with a pancreatic disease and only have a few years left remaining. I didn't want you nor your sibling's life to turn upside down so I never told anyone. Although it saddens me how you kids don't get along with each other, I didn't want to bring such news when all of you started to recover from your traumatic childhood.

I just want to apologize for all the neglect and harm I have caused you. Hopefully I can talk with your father before my death and have him realize his errors. When the doctors told me about my inevitable death, I was upset. I wasn't upset that my life would be cut short without having a proper life, but it's the fact that I wouldn't see any of my children again. We just became close after years of neglect, yet life does not permit me from recouping all the time that was lost. Everything has to come to an end but that doesn't mean it's the end of your life. You all have a future and I hope you make the most of it as you can.

From your shameful Mother,

Kari

[close letter](##closing-notes)

***

## closing-notes

========================================================================

* Mom overworks, collapses from exhaustion, finds out she has cancer and has little time to live
* when Mom dies, you are left homeless. Bad route, you join the deliquents and sell drugs. Good route, you tell your friend your problems and live with your friend whose parents own a bakery.

* if you go to club-day-reject, you'll end up homeless and go to a foster care house where your life never changes, abuses continue
* “You get use to someone—start to like them, even—and they leave.
* “A story has no beginning or **end**: arbitrarily one chooses that moment of experience from which to look back or from which to look ahead.” 
* It doesn’t upset me to think about dying. What upsets me is the idea of  John being alone after his spell passes. The idea of one of us without  the other. 
*  “Everything has to come to an end, sometime.”  
* “It's much easier to not know things sometimes. Things change and friends leave. And life doesn't stop for anybody.”  

* “It's not the endings that will haunt you
  But the space where they should lie,
  The things that simply faded
  Without one final wave goodbye.”  
* “Death is only the end if you assume the story is about you.”  
* life is a box of chocolates. YOu never know what you're gonna get
* have change variable determine the amount you see in the letter
* I never thought anyone would want to be like me.But she did.
   And now I find a new belief.
   I was born to meet her.
   All the choices, I’ve made in life were for one purpose: to meet her.
   I have no doubts.
   I know it must be true, because nothing has ever brought me this much joy or this much pain.