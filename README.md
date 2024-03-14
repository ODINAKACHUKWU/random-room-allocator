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
