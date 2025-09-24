# Web Linking

Swift implementation of Web Linking ([RFC5988](https://tools.ietf.org/html/rfc5988)).

## Installation

### Swift Package Manager

Add WebLinking to your project using Xcode or by adding it to your Package.swift:

```swift
dependencies: [
  .package(url: "https://github.com/lipka/WebLinking.swift.git", from: "3.0.0")
]
```

## Example

Given the following `Link` header on an `HTTPURLResponse`.

```
Link: <https://api.github.com/user/repos?page=3&per_page=100>; rel="next",
      <https://api.github.com/user/repos?page=50&per_page=100>; rel="last"
```

We can find the next link on a response:

```swift
if let link = response.findLink(relation: "next") {
  print("We have a next link with the URI: \(link.uri).")
}
```

Or introspect all available links:

```swift
for link in response.links {
  print("We have a link with the relation: \(link.relationType) to \(link.uri).")
}
```

## License

Web Linking is licensed under the MIT license. See [LICENSE](LICENSE) for more info.
