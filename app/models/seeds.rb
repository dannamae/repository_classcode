5.times do
  Login.create({

    username: Faker::Book.title,
    password: Faker::Book.title


    })
end

5.times do
  Signup.create({

    firstname: Faker::Book.title,
    middlename: Faker::Book.title,
    lastname: Faker::Book.title,
    subject: Faker::Book.title,
    classes: Faker::Number.decimal,
    username: Faker::Book.title,
    password: Faker::Book.title


    })
end
