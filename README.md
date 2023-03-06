# README

This is the same project of [PrayersMX](https://github.com/luisMartinez011/prayersMX) but it uses AWS RDS service with Postgres. I was having compatibility problems with gems that were designed for [Mongoid gem](https://github.com/mongodb/mongoid), because some gems were outdated or had horrible documentation. I become exhausted so I decided to switch back to using RDS databases. Another reason for leaving the other project is that Mongoid does not use ActiveRecord, and most gems compatible with Ruby on Rails use ActiveRecord.

This project is for a final project.

# Index 
* [General infrastructure](#general-infrastructure)
* [Email service](#email-service)
* [Roles](#roles)
* [Future implementations](#future-implementations)




## General infrastructure 
The project is a simple e-commerce platform that features a robust backend built in Ruby on Rails. The backend utilizes AWS RDS Postgres as the database, providing a reliable and scalable data storage solution. Additionally, AWS SES is used as a mailer, ensuring that customers receive timely notifications about their orders.

The backend is deployed on Heroku, providing high availability and fast response times. On the frontend side, React is used to create a modern and intuitive user interface. However, the admin interface is built in React and Electron, giving administrators the option to select either a web-based or desktop-based interface.

To ensure seamless deployment and scalability, the frontend webpage is deployed in AWS Amplify. The combination of these technologies creates a powerful and user-friendly e-commerce platform that is capable of meeting the needs of both customers and administrators alike.
<div style="text-align: center;">
  <img src="https://user-images.githubusercontent.com/95190949/223038557-35add4bf-574a-4831-94f3-05d3c33a7468.png"  width="60%" height="10%" >
</div>

## Email service 
Using AWS SES ensures that emails are delivered reliably and securely, with built-in safeguards to prevent spam and phishing attempts. The service is also highly scalable, ensuring that businesses can easily send emails to a large number of customers without worrying about performance issues.

The email templates are designed to be both informative and visually appealing, with a clean and modern layout that makes it easy for customers to quickly find the information they need. Whether you are a small business just getting started or a large enterprise with a global customer base, this email service is the perfect solution for keeping your customers informed and engaged.
<img src="https://user-images.githubusercontent.com/95190949/223040630-68f60857-8f50-4c27-9cce-4ed8af5cb09e.png" width=500>

## Roles
There are two roles "usuario" and "admin", you need to sign up to create an account and sign in to access the resources. The sign in endpoint return a token through the header, use this token to access all the resources. Admin role is disabled by default due security reasons.

People with no account has access to these functions: 

  
<img src="https://user-images.githubusercontent.com/95190949/221461552-b361fbcf-d7d9-4271-b355-baba597dcf65.png">
<img src="https://user-images.githubusercontent.com/95190949/221464675-40256c7f-737b-40d5-b540-9f1d6095df4a.png">


People with user role has access to these functions: 
![image](https://user-images.githubusercontent.com/95190949/221464216-8dea2db0-4c6a-4d48-9ae9-52acdf94aaca.png)
![image](https://user-images.githubusercontent.com/95190949/221464534-127d6e01-21b1-4181-a1ea-6be03f625407.png)
![image](https://user-images.githubusercontent.com/95190949/221464675-40256c7f-737b-40d5-b540-9f1d6095df4a.png)


People with admin role have full access.

## Future implementations
<ul>
  <li>Endpoints with relevant info for the admin dashboard</li>

</ul>





