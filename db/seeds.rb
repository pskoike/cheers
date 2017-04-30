#dummies
#d = User.new( first_name: "",
#  last_name: "",
#  facebook_picture_url: "",
#  email: "@gmail.com",
#  password: "123456",
#  encrypted_password: "$2a$11$b1UALeSIShywjDrI2ortU.Nn7sFrTVrciNLsn7JEfthMv9fX5nsWy"
#)
#d.save
PlaceOption.destroy_all
Confirmation.destroy_all
Hangout.destroy_all
User.destroy_all
Place.destroy_all

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
  facebook_picture_url: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAj6AAAAJGQzNDFjMTAxLTc5YTMtNDQ0Ni1hYTc4LTRhNWZiYTY2MGI0Zg.jpg",
  email: "jb@gmail.com",
  password: "123456",
  encrypted_password: "$2a$11$b1UALeSIShywjDrI2ortU.Nn7sFrTVrciNLsn7JEfthMv9fX5nsWy"
)
d.save

e = User.new( first_name: "Phil",
  last_name: "Doe",
  facebook_picture_url: "https://media.creativemornings.com/uploads/user/avatar/15261/Matthew_Avatar_square.jpg",
  email: "pd@gmail.com",
  password: "123456",
  encrypted_password: "$2a$11$b1UALeSIShywjDrI2ortU.Nn7sFrTVrciNLsn7JEfthMv9fX5nsWy"
)
e.save


print "Created: #{User.count} users "

hang1 = Hangout.new(
    title:"Aniversario no Empanadas",
    date:"20/05/2017",
    status: "confirmations_on_going",
    category:"Boteco",
    center_address:"Rua Wizard, 489 - Vila Madalena, São Paulo - SP, 05434-080"
    )
hang1.user = a
hang1.save

hang2 = Hangout.new(
    title:"Comemoracao Demoday",
    date:"07/05/2017",
    status: "confirmations_on_going",
    category:"Bar",
    )
hang2.user = d
hang2.save

hang3 = Hangout.new(
    title:"So pra beber",
    date:"20/06/2017",
    status: "confirmations_on_going",
    category:"Restaurante"
    )
hang3.user = b
hang3.save

hang4 = Hangout.new(
    title:"Porque a Noite uma crianca",
    date:"13/02/2017",
    status: "confirmations_on_going",
    category:"Bar"
    )
hang4.user = a
hang4.save

hang4 = Hangout.new(
    title:"La no passado",
    date:"13/06/2016",
    status: "confirmations_on_going",
    category:"Bar"
    )
hang4.user = d
hang4.save

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

conf14 = Confirmation.new(
  leaving_address: "1304 rua Mourato Coelho, São Paulo - SP",
  transportation: "bicicleta"
  )
  conf14.hangout = hang1
  conf14.user =  a
  conf14.save

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

######################
conf41 = Confirmation.new(
  leaving_address: "R. Pedroso Alvarenga, 66 - Itaim Bibi, São Paulo - SP",
  transportation: "carro"
  )
  conf41.hangout = hang4
  conf41.user =  b
  conf41.save

conf42 = Confirmation.new(
  leaving_address: "R. Treze de Maio, 147 - Bela Vista, São Paulo - SP",
  transportation: "carro"
  )
  conf42.hangout = hang4
  conf42.user =  c
  conf42.save

conf43 = Confirmation.new(
  leaving_address: "Rua Vergueiro, 399 - Vila Mariana, São Paulo - SP, 04101-300",
  transportation: "metro"
  )
  conf43.hangout = hang4
  conf43.user =  a
  conf43.save

conf44 = Confirmation.new(
  leaving_address: "Av. São João, 177 - Centro, São Paulo - SP, 01036-000",
  transportation: "carro"
  )
  conf44.hangout = hang4
  conf44.user =  e
  conf44.save


print "Created: #{Confirmation.count} confirmations "

bar1 = Place.new(
  name: "Empanadas Bar",
  address: "Rua Wizard, 489 - Vila Madalena, São Paulo - SP, 05434-080"
)
bar1.save

bar2 = Place.new(
  name: "Sabiá",
  address: "R. Purpurina, 370 - Vila Madalena, São Paulo - SP, 05435-030"
)
bar2.save

bar3 = Place.new(
  name: "Ambar",
  address: "R. Cunha Gago, 129 - Pinheiros, São Paulo - SP, 03178-200"
)
bar3.save

bar4 = Place.new(
  name: "Empório Alto dos Pinheiros",
  address: "R. Vupabussu, 305 - Pinheiros, São Paulo - SP, 05429-040"
)
bar4.save

bar5 = Place.new(
  name: "Frank",
  address: "Rua São Carlos do Pinhal, 424 - Bela Vista, São Paulo - SP, 01333-000"
)
bar5.save

restaurant1 = Place.new(
  name: "Esquina Mocotó",
  address: "Av. Nossa Sra. do Lorêto, 1108 - Vila Medeiros, São Paulo - SP, 02219-001"
)
restaurant1.save

restaurant2 = Place.new(
  name: "Rubaiyat",
  address: "Av. Brg. Faria Lima, 2954 - Jardim Paulistano, São Paulo - SP, 01401-000"
)
restaurant2.save

restaurant3 = Place.new(
  name: "D.O.M.",
  address: "R. Barão de Capanema, 549 - Jardins, São Paulo - SP, 01411-011"
)
restaurant3.save

restaurant4 = Place.new(
  name: "Komah",
  address: "R. Cônego Vicente Miguel Marino, 378 - Barra Funda, São Paulo - SP, 01135-020"
)
restaurant4.save

restaurant5 = Place.new(
  name: "Parigi Bistro",
  address: "Av. Magalhães de Castro, 12000 - Morumbi, São Paulo - SP, 05502-001"
)
restaurant5.save

bonbarato1 = Place.new(
  name: "Canaille Bar",
  address: "R. Cristiano Viana, 390 - Cerqueira César, São Paulo - SP, 05411-000"
)
bonbarato1.save

bonbarato2 = Place.new(
  name: "Dali Daqui",
  address: "Rua Vitorino Camilo 1093 - Esquina com Rua Conselheiro Brotero 71 - Barra Funda, São Paulo - SP, 01154-001"
)
bonbarato2.save

bonbarato3 = Place.new(
  name: "Lambe-Lambe",
  address: "Rua Aracaju, 239 - Higienópolis, São Paulo - SP, 01240-030"
)
bonbarato3.save

bonbarato4 = Place.new(
  name: "Z-deli",
  address: "R. Francisco Leitão, 16 - Pinheiros, São Paulo - SP, 05414-020"
)
bonbarato4.save

bonbarato5 = Place.new(
  name: "Belga Corner",
  address: "R. Pedroso Alvarenga, 666 - Itaim Bibi, São Paulo - SP, 04531-001"
)
bonbarato5.save

print "Created: #{Place.count} places "

opt11 = PlaceOption.new()
opt12 = PlaceOption.new()
opt13 = PlaceOption.new()
opt14 = PlaceOption.new()
opt15 = PlaceOption.new()
  opt11.hangout = hang1
  opt12.hangout = hang1
  opt13.hangout = hang1
  opt14.hangout = hang1
  opt15.hangout = hang1
    opt11.place = bar1
    opt12.place = bar2
    opt13.place = bar3
    opt14.place = bar4
    opt15.place = bar5
      opt11.save
      opt12.save
      opt13.save
      opt14.save
      opt15.save

opt21 = PlaceOption.new()
opt22 = PlaceOption.new()
opt23 = PlaceOption.new()
opt24 = PlaceOption.new()
opt25 = PlaceOption.new()
  opt21.hangout = hang2
  opt22.hangout = hang2
  opt23.hangout = hang2
  opt24.hangout = hang2
  opt25.hangout = hang2
    opt21.place = restaurant1
    opt22.place = restaurant2
    opt23.place = restaurant3
    opt24.place = restaurant4
    opt25.place = restaurant5
      opt21.save
      opt22.save
      opt23.save
      opt24.save
      opt25.save

print "Created: #{PlaceOption.count} Place Option "
