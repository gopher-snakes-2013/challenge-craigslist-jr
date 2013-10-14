#Robert's App Notes

###How to deploy a branch to Heroku
After setting up my files, I wanted to test that when I push to Heroku, it worked properly, and if not, I could troubleshoot any problems safely in a heroku-deploy branch. To deploy a branch to Heroku, type the following command:

git push heroku heroku-deploy:master

###How to merge brange one branch onto another
I want to merge my initial-deploy branch onto my craigslist-jr branch. To do so, first checkout the branch you want to merge onto using:

git checkout craigslist-jr

then to merge a branch onto craigslist-jr, type:

git merge initial-deploy

###What to do when git ISNT ignoring files listed in .gitignore
If git isn't ignoring files listed in the .gitignore file it's probably because that file was already being tracked BEFORE a rule was added to the .gitignore file to be ignored. To untrack the file so that git will start ignoring it, type:

git rm --cached <filename>

###Don't forget this after migrating your new table
After migrating your new table, check your schema (in sqlite3) to see if the table exists. It doesn't. What happened. After you migrate, don't forget to create the model:

class Item < ActiveRecord::Base
end

Migrate again. Now, when you check the schema, the table exists.

Better yet, create the model after running rake db:create_migration but before running rake db:migrate.

---
# Craigslist Jr
1. [Learning Objectives](#learning-objectives)
2. [Project Summary](#summary)
3. [Releases](#releases)

## Learning Objectives
Your goal is to independently build a simple database driven sinatra
application, test it, and deploy it to heroku.

Evaluate your ability to implement an application based on the
[Week 1 Learning Objectives](../../phase-2-guide/week-1/learning-objectives.md)


## Summary
Craigslist is a really cool place to get all kinds of things!
Like stolen bicycles!

Now build it.

## Releases

### Release 1
* Guest may list an item for sale with fields for title,
  description and price
* Guest may edit the item with the secret URL they are
  given after listing an item

### Release 2
* Guest may register as a User
* User may edit any of the listings they created without
  remembering the secret URL
* User may delete a listing