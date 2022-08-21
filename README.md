# README

### Seeds

```ruby
params = { email: 'admin@mail.ru', password: '123123' }
result = Api::V1::Users::SignUpInteractor.call(params: params)
result.data
```

### WS
```js
let ws = new WebSocket('ws://localhost:8080/cable?token=JWT_TOKEN');

ws.onopen = function(){
  ws.send(JSON.stringify({"command": "subscribe","identifier": "{\"channel\": \"RetroChannel\", \"team_id\": \"TEAM_ID\", \"retro_id\":\"RETRO_ID\"}"}))
}    

ws.onmessage = function(msg) {
  console.log(JSON.parse(msg.data).message);
}
```

### Docker
```bash
docker build --no-cache .
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
docker-compose up --build --force-recreate --no-deps
```