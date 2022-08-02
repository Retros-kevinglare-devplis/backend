# README

```ruby
q = User.create(email: 'admin@mail.ru', username: 'admin', first_name: 'retro', last_name: 'sprint', encrypted_password: Digest::SHA256.hexdigest('123123'))
w = AuthToken.create(user: q, expired_at: Time.current + 1.week, refresh_token: SecureRandom.uuid)
```
