```
  _____  _____ __   _ _     _ _______ _______ ______
 |_____]   |   | \  | |_____| |______ |_____| |     \
 |       __|__ |  \_| |     | |______ |     | |_____/
```

Pinhead is a colletion of machine-readable descriptions of classic
coin-op game pinouts. While much of this information is available
elsewhere, the goals of Pinhead are somewhat different. The primary
goal is to collect *accurate* and *complete* information; quality is
more important than quantity.

To that end, the information here comes directly from the schematics
for the part in question. Pin descriptions are identical to the ones
in the schematics, minus minor typographical changes or clarification.

## Pinout format

Pinouts are in JSON.

### General format

Each file contains a JSON object containing two keys. The value of the
`pinout` key must be a string describing what the pinout is for. The
second key is `conns`, which is an array of connector objects.

```json
{
    "pinout": "Asteroids",
    "conns": []
    ...
}
```

### Connectors

Connector objects contain a description of (and pinout for) a single
connector. The keys are:

 - `id` (String): Connector identifier. This should be the identifier
   listed in the schematic and/or printed on the device near the
   connector.
 - `type` (String): Connector type. This is freeform, but should
   accurately represent the type. Examples are `card_edge` for an edge
   connector, `molex_mlx` (String): for a Molex connector, etc.
 - `pitch` (String): The pitch of the connector. Both mm and inches
   should be included.
 - `num_pins` (Integer): The total number of pins the connector
   has. For a 22-pin `card_edge` connector, this would be `44`.
 - `desc` (String): A description of the function of the connector.
 - `pins` (Pin object): List of the pins and their functions.

Every key must be populated. Example:

```json
{"id": "P20",
 "type": "card_edge",
 "pitch": "3.96mm/.156\"",
 "num_pins": 44,
 "desc": "22-pin double-sided .156 card edge connector"
 "pins": {"1": "GND",
          "2": "+5V"}
}
```

## Corrections and additions

Please [file an issue](https://github.com/ieure/pinhead/issues/new) or
open a pull request.

## Copyright

Pinhead contains the electronic embodiment of facts; facts are not
copyrightable. I place all original work Pinhead represents (the file
format and description, this document) into the public domain.


