# Record decoders

Add `dream-validate.ppx` to the Dune preprocessing step for the module that defines
the records:

```lisp
(preprocess (pps dream-validate.ppx))
```

## Form fields

```ocaml
type registration_form = {
  username : string [@form.trim] [@validate.min_length 3];
  password : string [@validate.min_length 8];
}
[@@deriving dream_form]

let decode_registration fields =
  registration_form_of_source (Dream_validate.Source.of_fields fields)
```

The result is a typed record or a list of `Dream_validate.error` values. A
handler can call `registration_form_of_request request` for form inputs. The
same deriver also generates query, route and session helpers. Choose the helper
for the input you intend to read; the names do not make all sources equivalent.

## JSON records

```ocaml
type post_json = {
  body : string [@json.trim] [@validate.required];
  media_ids : string list [@json.key "mediaIds"];
  draft : bool option;
}
[@@deriving dream_json]

let decode_post json = post_json_of_json json
```

`dream_json` also generates helpers for JSON strings and Dream JSON requests.
For a complete executable that uses the runtime API without PPX, see
[examples/demo](../examples/demo/main.ml).

## Attributes and limits

The implementation recognizes field-key overrides, trimming, required and
length checks, and named character-set validation. Session fields can use
`session.key` and `session.csv`. See the
[PPX implementation](../ppx) and [PPX tests](../test/test_ppx.ml) for the accepted
record shapes and exact generated names.

These decoders validate the declared fields. Your application still decides
which user may perform an action and what the decoded values mean.
