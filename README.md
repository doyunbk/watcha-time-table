<h1 align="center">Ruby on Rails Project 🥑</h1>

## ✨ Demo

[Link to Demo](https://vimeo.com/672977536)

## 🚀 Built with

- Ruby 2.6.2
- Rails 5.2.1
- mysql
- devise
- ransack

## 💻 Getting Started

### Installation

1. Clone the repository
   ```sh
   git clone https://github.com/doyunbk/watcha-time-table.git
   ```
2. Navigate the project folder
   ```sh
   cd myapp
   ```


### Usage

#### Run in Local 🏠
_Run application in `Rails`_

```sh
rails s
```

## 📦 Structure

#### Models

- `User` - [DEVISE]
```
fields : email, password
```

- `Course`
```
fields : code, title, description, professor, location, start_time, end_time, dayofweek
```

- `Enrollment`
```
fields : user_id, course_id
```

#### CRUD Operations

##### 1. `User`
- Create : Create an `User` 
- Get : Fetch `User` details
- Update : Edit `User` details
- Delete : Delete an `User` 🚨 `Enrollment` records will be deleted accordingly

##### 2. `Course`
- Create : Create a `Course` 
- Get : Fetch `Course` details
- Update : Edit `Course` details
- Delete : Delete a `Course` 🚨 `Enrollment` records will be deleted accordingly

##### 3. `Enrollment`
- Create : Create an `Enrollment` 
- Get : Fetch `Enrollment` details
- Update : Edit `Enrollment` details
- Delete : Delete an `Enrollment` 

#### App features

##### 1. `Signup / Signout Users`

##### 2. `Search courses by title, code and professor`

##### 3. `Able to enroll courses`

##### 4. `Able to cancel courses`

##### 5. `Able to get notified from an existing enrolled course`

##### 6. `Able to get notified from time conflicts`


### 👨🏻‍💻👩🏻‍💻 Example of Usage

The sample data set is included in this project

`User`
```
email : aa1@gmail.com, password: 123qwe
email : aa2@gmail.com, password: 123qwe
```
