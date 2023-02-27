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

  
<img src="https://user-images.githubusercontent.com/95190949/221461552-b361fbcf-d7d9-4271-b355-baba597dcf65.png">
<img src="https://user-images.githubusercontent.com/95190949/221464675-40256c7f-737b-40d5-b540-9f1d6095df4a.png">


People with user role has access to these functions: 
![image](https://user-images.githubusercontent.com/95190949/221464216-8dea2db0-4c6a-4d48-9ae9-52acdf94aaca.png)
![image](https://user-images.githubusercontent.com/95190949/221464534-127d6e01-21b1-4181-a1ea-6be03f625407.png)
![image](https://user-images.githubusercontent.com/95190949/221464675-40256c7f-737b-40d5-b540-9f1d6095df4a.png)


People with admin role have full access.



<h2>General infrastructure</h2>
<div style="text-align: center;">
  <img src="https://user-images.githubusercontent.com/95190949/221456880-fb0048d1-df24-4729-91b1-0b812cbc6a70.png"  width="60%" height="10%" >
</div>


