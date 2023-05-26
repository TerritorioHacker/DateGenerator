# DateGenerator

DateGenerator is a command-line tool that generates a date library in day-month-year format. It utilizes a user-defined range of years to create a text file with all the possible dates within that range. This tool is useful for generating date dictionaries for testing, temporal analysis, and other applications that require a comprehensive set of dates.

## Features

- Generates a date library with day-month-year format.
- User-defined range of years.
- Supports customization of month and day ranges.
- Saves the date library to a text file.

## Installation

1. Clone the repository:

```
bash git clone https://github.com/TerritorioHacker/DateGenerator.git
```

2. Change into the project directory:

```
cd DateGenerator
```

Usage
To generate the date library, run the following command:
```
./dateGenerator.sh [yearI] [yearF]
```

Replace [yearI] and [yearF] with the desired range of years.

For example, to generate the date library for the years 2020 to 2023, use:
```
./dateGenerator.sh 2020 2023
```
The generated date library will be saved in the file datelist.txt.
