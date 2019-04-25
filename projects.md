# Project - Web Programming with Ruby

:star: Remember to gather PDA evidence :star:

Over the next week you will build an app to consolidate and expand on everything you have learned:

* Object oriented programming with Ruby
* Test Driven Development
* Web Programming (REST, MVC)
* Interacting with a PostgreSQL database (CRUD)

## Rules

The project must be built using only:

* HTML / CSS 
 * (^ you could complete Part 2 of the Zombie M2M task to practice these)
* Ruby
* Sinatra
* PostgreSQL and the PG gem

It must **NOT** use:

* Any Object Relational Mapper (e.g. ActiveRecord)
* JavaScript. At all. Don't even think about it.
* Any pre-built CSS libraries, such as Bootstrap.
* Authentication. Assume that the user already has secure access to the app.

All of these will be covered later in the course. Do not make any attempt to use them this week, even if you've used them before.

Make lots of little (but sensible!) git commits. The number of commits in your final submission is one of the criteria your work will be judged on.

## Briefs

These briefs detail what is expected of you, including an MVP. Note that the MVP is the **Minimum** Viable Product. You are strongly encouraged to go beyond these specifications, and some possible extensions are provided.

Talk through your ideas with an instructor during the planning process, and before you begin coding.

### Vet Management App

A veterinary practice has approached you to build a web application to help them manage their animals and vets. A vet may look after many animals at a time. An animal is registered with only one vet. 

#### MVP

- The practice wants to be able to register / track animals. Important information for the vets to know is -
  - Name
  - Date Of Birth (use a VARCHAR initially)
  - Type of animal
  - Contact details for the owner
  - Treatment notes
- Be able to assign animals to vets
- CRUD actions for vets / animals - remember the user - what would they want to see on each View? What Views should there be?

### Possible Extensions

- If an owner has multiple animals we don't want to keep updating contact details separately for each pet. Extend your application to reflect that an owner can have many pets and to more sensibly keep track of owners' details (avoiding repetition / inconsistencies)
- Sometimes vets are called in for consultations on pets in another vet's care. Record these consultations and enable the practice to see useful info e.g. all the vets a pet has been seen by.
- Handle check-in / check-out dates
- Let the practice see all animals currently in the practice (today's date is between the check-in and check-out?)
- Sometimes an owner does not know the DOB. Allow them to enter an age instead. Try and make sure this always up to date - ie if they visit again a year from now a 3 yr old dog is now 4.
- Add extra functionality of your choosing - assigning treatments, a more comprehensive way of maintaining treatment notes over time. Appointments. Pricing / billing.

### Spending Tracker

Build an app that allows a user to track their spending.

#### MVP

* The app should allow the user to create, edit and delete merchants, e.g. Tesco, Amazon, ScotRail
* The app should allow the user to create, edit and delete tags for their spending, e.g. groceries, entertainment, transport
* The user should be able to assign tags and merchants to a transaction, as well as an amount spent on each transaction.
* The app should display all the transactions a user has made in a single view, with each transaction's amount, merchant and tag, and a total for all transactions.

#### Inspired by:

Monzo, MoneyDashboard, lots of mobile/online banking apps

#### Possible Extensions

* Transactions should have a timestamp, and the user should be able to view transactions sorted by the time they took place.
* The user should be able to supply a budget, and the app should alert the user somehow when when they are nearing this budget or have gone over it.
* The user should be able to filter their view of transactions, for example, to view all transactions in a given month, or view all spending on groceries.


### Gym

A local gym has asked you to build a piece of software to help them to manage memberships, and register members for classes.

#### MVP

- The app should allow the gym to create / edit / delete members
- The app should allow the gym to create / edit / delete classes
- The app should allow the gym to add members to specific classes
- The app should show a list of all upcoming classes
- The app should show all members that are registered for a particular class 

#### Inspired By

[Glofox](https://www.glofox.com/club-solution/), [Pike13](https://www.pike13.com/pike13-scheduling-software-demo)

#### Possible Extensions

- Classes could have a maximum capacity, and users can only be added while there is space remaining.
- The gym could be able to give its members Premium or Standard membership. Standard members can only be signed up for classes during off-peak hours.

### Record Store

The owner of a Record Store wants an app which will help to keep on top of the store inventory. This is not an app that customers will see, but will be used to check stock levels and see what needs to be ordered soon.

You should be able to add stock, which would have an Artist and Album as well as the quantity available.

You could also twist this brief for another kind of store if you wish.

#### MVP:

* Create albums with the quantity that are in stock
* Create artists
* Show an inventory page listing albums and artists
* Show a stock level for the inventory items e.g. High/Medium/Low

#### Possible Extensions:

* Add a buy and sell price to each stock item
* Calculate the possible markup on items and show on inventory page
* Add a genre to an Album
* Any other ideas you might come up with


## Submission

Submit a link to your Github repo through the Homework Submission form as soon as the repo has been created.

Your code will be reviewed with an instructor on Thursday afternoon.

## Presentation

Presentations will be held on Friday. You will have 10 minutes to present your work, with 5 minutes for questions.

We expect you to:

* Show your sketches, notes, diagrams, wireframes and user planning
* Demonstrate your app's functionality
* Talk about some code that you are particularly proud of
* Highlight your main learning points

Do not:

* Talk through every single line of code
* Go over the time limit

## Asking for help

The instructional team will be on hand for technical assistance, but you are strongly encouraged to take this opportunity to practise self-sufficiency, as will be expected of you as a professional software developer.

Before asking an instructor for help this week, you should be ready to answer the following questions:

* What are you trying to achieve?
* What do you think the problem is?
* What have you tried so far?
* What did Google say about your error message?

## Attendance

The cohort will meet at the usual time every morning. Your attendance is recorded every day as normal.

## PDA Reminder:

As part of this project you are required to take screenshots of the following:

```
- A Use Case Diagram  
- A Class diagram  
- An Object diagram  
- An Activity Diagram
- A user sitemap
- Two wireframe designs
- An example of pseudocode for a function
- One of your projects where you have worked alone and attach the Github link
```

Show user input being processed according to design requirements. Take a screenshot of:

```
- The user inputting something into your program
- The user input being saved or used in some way
```

Show an interaction with data persistence. Take a screenshot of:

```
- Data being inputted into your program
- Confirmation of the data being saved
```

Show the correct output of results and feedback to user. Take a screenshot of:

```
- The user requesting information or an action to be performed
- The user request being processed correctly and demonstrated in the program
```

Produce an Implementations Constraints plan detailing the following factors:

```
 - Hardware and software platforms
 - Performance requirements
 - Persistent storage and transactions
 - Usability
 - Budgets
 - Time   
```

- Go to your [PDA Checklist](https://github.com/codeclan/pda/tree/master/Evidence%20Gathering%20Portfolio)

- Submit your PDA evidence (screenshots, etc.) to your own PDA repo

PDA Reference: 
A.D 1, A.D 2, A.D 3, A.D 4, A.D 6, P5, P6, P10, P11, P13, P14, P15
