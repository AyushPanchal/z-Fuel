#zFuel

Problem : What if your vehicles runs out of fuel on middle of trip and there's no gas station nearby?

Solution : An on demand fuel delivery just on tap of the button.

Information : zFuel is an online platform for the on demand fuel delivery, where user can order fuel with just tap
of button.

How is it possible ? : We are creating this platform on a flutter for the frontend and firebase as a backend.

TechStack : Flutter,
Firebase,
GetX,
Python,
PyneCone,
HTML, CSS, JS,


Module :
1. Customer
- Order petrol/diesel.
2. Gas station
- Receive order from customer.
- Approve customer request.
- Launch fleet of fuel vehicles for the timely delivery of fuel.
3. Fleet driver
- Receive/Approve/Reject requests
4. Admin
- Have access to the database and monitor activities.


Models:
User Model
------------------------------------------------------------------------
- Full Name
- Email
- Phone Number
- create date
- updated date
- Last Location
- Order history
- User_id
- profilePic


            Order Model
            ------------------------------------------------------------------------
            - User ID
            - Order ID
            - gasStationId
            - gasStation
            - Type of fuel (petrol/diesel)
            - Quantity
            - Delivery address
            - Order status (Pending/Approved/Delivered/Canceled)
            - Order date
            - Delivery date

            Fleet Model
            ------------------------------------------------------------------------
            - Vehicle ID
            - FuelPump ID
            - FuelPump Name
            - Driver Name
            - Driver Phone Number
            - Vehicle Type
            - Fuel Capacity
            - Location
            - Availability Status (Available/Unavailable)

            Gas Station Model
            ------------------------------------------------------------------------
            - Gas Station ID
            - Name
            - area
            - city
            - zipCode
            - email
            - phoneNumber
            - Fleet Capacity
            - Fleet Availability
            - Order History

