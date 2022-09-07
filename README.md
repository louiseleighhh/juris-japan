# ⚖️ Juris Japan

This is a project created by Le Wagon students in order to ease foreigners' legal experiences in Japan by creating a list of steps needed to be accomplished

![Hero Page](https://i.postimg.cc/gkbx7LCj/Screen-Shot-2022-09-07-at-14-09-19.png)
![Bookmark Cards](https://i.postimg.cc/0QqgvxPY/Screen-Shot-2022-09-07-at-14-11-40.png)
![Procedures Page](https://i.postimg.cc/Fs6BmmxY/Screen-Shot-2022-09-07-at-14-13-12.png)
![Law Firms Page](https://i.postimg.cc/gJp75DH4/Screen-Shot-2022-09-07-at-14-12-38.png)
![Steps Page](https://i.postimg.cc/d1n5fK1t/Screen-Shot-2022-09-07-at-14-13-33.png)
<br>
App home: https://juris-japan.com
   

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Team Members
- Sara Jessome
- [Louise Leigh Capala](https://www.linkedin.com/in/louiseleighhh/)
- [Rajan Ladwa](https://www.linkedin.com/in/rajan-ladwa-95716742/)
- Michelle Barrie

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License
