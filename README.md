# random-room-allocator

Random room allocator is an algorithm that randomly allocates offices and rooms to employees of an organization. It is written with Ruby.

## Project Scope:

- The app reads either a text, json or csv file to get names of employees (male and female; fellow and staff) to be allocated offices and rooms
- Allocates male staff to male offices
- Allocates female staff to female offices
- Allocates male fellows to male rooms
- Allocates female fellows to female rooms
- Creates an output folder where allocations are reported in either text, json, csv depending on the specified type
  - male room allocation
  - female room allocation
  - male office allocation
  - female office allocation
  - unallocated staff
  - unallocated fellows

## Notes:

- Currently, it only reads text file and outputs json. Updates will be made later for it to read text, csv or json file and output text, csv or json.

## How to use

- Clone the repo.

- Open a terminal and cd to the root directory.

- Update the data in the text files within the `files` folder to have the employees to be allocated rooms and offices, male rooms, female rooms and offices to be allocated.

- Run the app using the command `ruby app` on the terminal.

- Open the `allocations` folder to see the allocation output.
