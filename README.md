# MUL API

This API serves as a database for IDs from masterunitlist.info. There is currently no publicly-available API to access 
unit information. However, the MegaMek project has a database of units and their IDs on the MUL. This API serves those 
IDs to be used for client applications. 

## Setup

1. Download MegaMek from https://megamek.org/downloads
2. Extract MegaMek, then go into the `data/mechfiles` directory
3. Extract all `.zip` files in that directory into their own folders. On MacOS, doing this with Archive Utility 
   automates the process.
4. Move these folders into MUL API's `/data` directory.
5. Do the usual Rails stuff (`bundle install`, `rails db:setup`, etc)
6. Seed your database from the MM data files with `rails db:seed`.