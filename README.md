# C L U B H O U S E

## Description

View this app [here](http://mps-clubhouse.herokuapp.com/)

Clubhouse is my implementation of the clubhouse project from The Odin Project. The goal of this project is to gain familiarity with user creation and authentication. This project was developed from scratch based on the following description:

> In this project, you'll be building an exclusive clubhouse where your members can write embarrassing posts about non-members. Inside the clubhouse, members can see who the author of a post is but, outside, they can only see the story and wonder who wrote it.

## Vision
My vision for the app was something like the YikYak app. The index page would display the most recent posts app-wide, and then from that page the user would be able to access the individual stories (though, without a comment system this seems superfluous). If the user is logged in, she would be able to select the authors from the index page as well (or from a post page), and see the recent posts by that author. It is not the intention of the developer that posts support any type of comment functionality at this time.

## Methodology
I began by creating a short spec document that outlined the types of models and controllers I would need, and how my model associations would behave. From there, I created the database models and made sure they had all of the requisite attributes. After that, I thought about controller inputs and what my routing scheme would be. Then, I prioritized controller action implementation by complexity and started with the easiest. The views were developed in tandem with the controller actions. Altogether, I would estiamte that I have around 8 hours of time invested in this app.

## Improvements
1. Graphical update
   Clearly the app is in need of a graphical rework. This may come in the future as I learn more about the front end.
2. Pagination of posts on the home page and in user profiles
   At this time the behavior of the app is that the front and user pages only display the 10 most recent posts from the database. This was implemented now merely as a preliminary framework for learning about more advanced ActiveRecord concepts.
