# README

This is the same project of [PrayersMX](https://github.com/luisMartinez011/prayersMX) but it uses AWS RDS service with Postgres. I was having compatibility problems with gems that were designed for [Mongoid gem](https://github.com/mongodb/mongoid), but some gems were outdated or had horrible documentation. I become exhausted so I decided to switch back to using RDS databases. Another reason for leaving the other project is that Mongoid does not use ActiveRecord, and most gems compatible with Ruby on Rails use ActiveRecord.

This project is for a final project.

<h2>Future implemantations</h2>
<ul>
  <li>QR implementation. I am planning to send a random number as a code to the frontend, and from the frontend just download a QR package and convert the code in a QR </li>
  <li>Email the user, when purchase is done</li>
  <li>Endpoints with relevant info for the admin dashboard</li>

</ul>

<h2>Roles</h2>
People with no account has access to these functions: 

<ul>
  <li>User sign up and signin</li>
  <li></li>
  <li></li>
<img src="https://user-images.githubusercontent.com/95190949/221461552-b361fbcf-d7d9-4271-b355-baba597dcf65.png">


</ul>
People with user rola has access to these functions: 
<ul>
  <li></li>
  <li></li>
  <li></li>
</ul>
People with admin role have full access.

<img src="https://user-images.githubusercontent.com/95190949/221460775-5e2070bf-c856-4dd1-aa79-76ff7fe7c810.png">

<h2>General infrastructure</h2>
<div style="text-align: center;">
  <img src="https://user-images.githubusercontent.com/95190949/221456880-fb0048d1-df24-4729-91b1-0b812cbc6a70.png"  width="60%" height="10%" >
</div>


