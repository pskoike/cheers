#dummies
#d = User.new( first_name: "",
#  last_name: "",
#  facebook_picture_url: "",
#  email: "@gmail.com",
#  password: "123456",
#  encrypted_password: "$2a$11$b1UALeSIShywjDrI2ortU.Nn7sFrTVrciNLsn7JEfthMv9fX5nsWy"
#)
#d.save
Confirmation.destroy_all
Hangout.destroy_all
User.destroy_all

a = User.new( first_name: "Abilio",
  last_name: "Diniz",
  facebook_picture_url: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAALuAAAAJDllYmNhNDQwLTUxMWQtNGM5MS05MTVmLTg5NTg5NmM0MjNkMg.jpg",
  email: "ad@gmail.com",
  password: "123456",
  encrypted_password: "$2a$11$b1UALeSIShywjDrI2ortU.Nn7sFrTVrciNLsn7JEfthMv9fX5nsWy"
)
a.save

b = User.new( first_name: "Gordon",
  last_name: "Ramsey",
  facebook_picture_url: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/1/000/049/35e/1f9e208.jpg",
  email: "gr@gmail.com",
  password: "123456",
  encrypted_password: "$2a$11$b1UALeSIShywjDrI2ortU.Nn7sFrTVrciNLsn7JEfthMv9fX5nsWy"
)
b.save

c = User.new( first_name: "Logan",
  last_name: "Green",
  facebook_picture_url: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAeGAAAAJDM5ZmMxYWI5LTFmYTgtNGE3MC1hZjQ4LTc2OTVmNDdjMGI4MQ.jpg",
  email: "lg@gmail.com",
  password: "123456",
  encrypted_password: "$2a$11$b1UALeSIShywjDrI2ortU.Nn7sFrTVrciNLsn7JEfthMv9fX5nsWy"
)
c.save

d = User.new( first_name: "Jean-Baptiste",
  last_name: "Feldis",
  facebook_picture_url: "",
  email: "jb@gmail.com",
  password: "123456",
  encrypted_password: "$2a$11$b1UALeSIShywjDrI2ortU.Nn7sFrTVrciNLsn7JEfthMv9fX5nsWy"
)
d.save

e = User.new( first_name: "Phil",
  last_name: "Doe",
  facebook_picture_url: "https://www.cegepgarneau.ca/assets/img/programmes/stages/informatique.jpg",
  email: "pd@gmail.com",
  password: "123456",
  encrypted_password: "$2a$11$b1UALeSIShywjDrI2ortU.Nn7sFrTVrciNLsn7JEfthMv9fX5nsWy"
)
e.save




print "Created: #{User.count} users "

hang1 = Hangout.new(
    title:"Aniversario no Empanadas",
    date:"20/05/2017",
    category:"Boteco",
    center_address:"Rua Wizard, 489 - Vila Madalena, São Paulo - SP, 05434-080"
    )
hang1.user = a
hang1.save

hang2 = Hangout.new(
    title:"Comemoracao Demoday",
    date:"07/05/2017",
    category:"Bar",
    )
hang2.user = d
hang2.save

hang3 = Hangout.new(
    title:"So pra beber",
    date:"20/06/2017",
    category:"Restaurante"
    )
hang3.user = b
hang3.save


print "Created: #{Hangout.count} hangouts "

conf11 = Confirmation.new(
  leaving_address: "R. Treze de Maio, 1947 - Bela Vista, São Paulo - SP, 01327-000",
  transportation: "carro"
  )
  conf11.hangout = hang1
  conf11.user =  b
  conf11.save

conf12 = Confirmation.new(
  leaving_address: "Francisco Matarazzo, 1705 - Água Branca, São Paulo - SP, 05001-200",
  transportation: "metro"
  )
  conf12.hangout = hang1
  conf12.user =  e
  conf12.save

conf13 = Confirmation.new(
  leaving_address: "Butantã, São Paulo - SP, 03178-200",
  transportation: "carro"
  )
  conf13.hangout = hang1
  conf13.user =  d
  conf13.save


conf21 = Confirmation.new(
  leaving_address: "R. Treze de Maio, 1947 - Bela Vista, São Paulo - SP, 01327-000",
  transportation: "carro"
  )
  conf21.hangout = hang2
  conf21.user =  b
  conf21.save

######################
conf22 = Confirmation.new(
  leaving_address: "R. Pedroso Alvarenga, 666 - Itaim Bibi, São Paulo - SP, 04531-001",
  transportation: "a pe"
  )
  conf22.hangout = hang2
  conf22.user =  c
  conf22.save

conf23 = Confirmation.new(
  leaving_address: "Av. Ibirapuera, 3103 - Moema, São Paulo - SP, 04029-902",
  transportation: "carro"
  )
  conf23.hangout = hang2
  conf23.user =  e
  conf23.save

######################
conf31 = Confirmation.new(
  leaving_address: "R. Treze de Maio, 1947 - Bela Vista, São Paulo - SP, 01327-000",
  transportation: "carro"
  )
  conf31.hangout = hang3
  conf31.user =  b
  conf31.save

conf32 = Confirmation.new(
  leaving_address: "R. Pedroso Alvarenga, 666 - Itaim Bibi, São Paulo - SP, 04531-001",
  transportation: "a pe"
  )
  conf32.hangout = hang3
  conf32.user =  c
  conf32.save

conf33 = Confirmation.new(
  leaving_address: "Av. São João, 677 - Centro, São Paulo - SP, 01036-000",
  transportation: "bicicleta"
  )
  conf33.hangout = hang3
  conf33.user =  a
  conf33.save

conf34 = Confirmation.new(
  leaving_address: "Rua Vergueiro, 3799 - Vila Mariana, São Paulo - SP, 04101-300",
  transportation: "carro"
  )
  conf34.hangout = hang3
  conf34.user =  e
  conf34.save


print "Created: #{Confirmation.count} confirmations "
