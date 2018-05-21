## Run App

- bundle install
- rake db:create
- rake db:migrate
- rails s

# DOC API

### Login

API login

```
url:/api/v1/sessions
type: post
params: email, paswword
return: json { "authentication_token": "user_token" }
status: 201
```

### Logout
 
API Logout

```
url: /api/v1/sessions/authentication_token
type: delete
params: user_email, user_token
return: 
status: 200
```

## Task

### GET tasks
```
url: /api/v1/tasks
type: get
params header: { Content-Type: 'application/json', Authorization: 'Bearer user_token' }
params: { type: "[nil || mytask]", column: "[name || due_date || priority]" direction: "[ asc || desc ]" }
return: [{
      "id": 4,
      "name": "name task",
      "due_date": "2018-05-15",
      "priority": "high",
      "doit": false,
      "user": {
          "id": 2,
          "email": "some@email.co"
      }
  },{...}]
status: 200
```

### GET task
```
url: /api/v1/tasks/task_id
type: get
params header: { Authorization: 'Bearer user_token' }
params: 
return: {
      "id": task_id,
      "name": "name task",
      "due_date": "2018-05-15",
      "priority": "high",
      "doit": false,
      "user": {
          "id": 2,
          "email": "some@email.co"
      }
  }]
status: 200
```



### New task
```
url: /api/v1/tasks
type: post
params header: { Authorization: 'Bearer user_token' }
params: {
    task: {
      name: 'task name',
      due_date: '2018-05-19',
      doit: true,
      user_id: user_id,
      priority: '[high medium low]'
    }
  }
return: {
      "id": task_id,
      "name": "name task",
      "due_date": "2018-05-15",
      "priority": "high",
      "doit": false || true,
      "user": {
          "id": 2,
          "email": "some@email.co"
      }
  }]
status: 200
```

### Update task
```
url: /api/v1/tasks/task_id
type: post
params header: { Authorization: 'Bearer user_token' }
params: {
    task: {
      name: 'task name',
      due_date: '2018-05-19',
      doit: true || false,
      user_id: user_id,
      priority: '[high medium low]'
    }
  }
return: {
      "id": task_id,
      "name": "name task",
      "due_date": "2018-05-15",
      "priority": "high",
      "doit": false,
      "user": {
          "id": 2,
          "email": "some@email.co"
      }
  }]
status: 200
```

### Destroy task
```
url: /api/v1/tasks/task_id
type: post
params header: { Authorization: 'Bearer user_token' }
params:
return: 
status: 200
```

