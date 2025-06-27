puts "Limpando dados..."
Guest.destroy_all
Participant.destroy_all
Party.destroy_all
User.destroy_all

puts "Criando usuários..."
admin = User.create!(
  email: "admin@festavip.com",
  phone: "41999999999",
  state: "PR",
  city: "Curitiba",
  role: :admin,
  password: "123456"
)

usuario = User.create!(
  email: "usuario@festavip.com",
  phone: "41988888888",
  state: "SP",
  city: "São Paulo",
  role: :usuario,
  password: "123456"
)

puts "Criando festas..."
festa1 = admin.parties.create!(
  scheduled_at: 3.days.from_now,
  street: "Rua das Flores",
  number: "123",
  city: "Curitiba",
  state: "PR",
  birthday_person_name: "Ana",
  birthday_person_age: 8,
  status: :ativa
)

festa2 = usuario.parties.create!(
  scheduled_at: 7.days.from_now,
  street: "Av. Paulista",
  number: "456",
  city: "São Paulo",
  state: "SP",
  birthday_person_name: "Lucas",
  birthday_person_age: 5,
  status: :ativa
)

puts "Criando participantes e convidados..."
3.times do |i|
  p = festa1.participants.create!(
    full_name: "Participante #{i + 1} - Festa Ana",
    phone: "4199000000#{i}",
    rg: "RGF1#{i}"
  )

  2.times do |j|
    p.guests.create!(
      name: "Convidado #{j + 1} do Participante #{i + 1}",
      rg: "RGG1#{i}#{j}",
      age: rand(3..10),
      guest_type: j.even? ? "child" : "adult"
    )
  end
end

2.times do |i|
  p = festa2.participants.create!(
    full_name: "Participante #{i + 1} - Festa Lucas",
    phone: "1198000000#{i}",
    rg: "RGF2#{i}"
  )

  1.times do |j|
    p.guests.create!(
      name: "Convidado #{j + 1} do Participante #{i + 1}",
      rg: "RGG2#{i}#{j}",
      age: rand(4..12),
      guest_type: "adult"
    )
  end
end

puts "Seeds finalizados com sucesso!"
