```
  _____  _____ __   _ _     _ _______ _______ ______
 |_____|   |   | \  | |_____| |______ |_____| |     \
 |       __|__ |  \_| |     | |______ |     | |_____/
```

Pinhead is a colletion of machine-readable descriptions of classic
coin-op game pinouts.  Much of this information has been compiled
already, the quality is highly variable.  While it’s usually enough to
get a board running, many of the fine details are missing, such as
`/RESET` lines for Atari boards, player 2 controls, cocktail mode
jumpers, and so on. The goal of Pinhead is to collect *accurate* and
*complete* information; quality is more important than quantity.

The information here mostly comes directly from the schematics for the
part in question, but even this often doesn’t provide a complete
picture, so additional sources are sometimes used. Pin descriptions
are identical to the schematics wherever possible, minus minor
typographical changes or clarification.

Pinouts are represented in JSON. I chose JSON because it is trivially
readable by machines and reasonably readable by humans.

### General format

The complete schema is defined in [`schema.json`](schema.json).

Each file contains a JSON object containing two keys. The value of the
`pinout` key must be a string describing what the pinout is for. The
second key is `conns`, which is an array of connector objects.

The format is general enough to represent any kind of connector on any
kind of device.

Example:

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
copyrightable. To the extent that Pinhead represents original work
(the file format and description, this document), I place it into the
public domain.
