#!/usr/bin/swift -F Carthage/Build/Mac/

// Tell Swift where to find framework

import PathKit
import Yaml
import Stencil
import Markingbird

// read config file
let configFile = Path("config.yml")
let contents: String = try configFile.read()
let config = Yaml.load(contents).value!

let site = ["Name": config["name"], "Description": config["description"]]

// load templates
let indexTemplate = try Template(path: "theme/base.html")
let postTemplate = try Template(path: "theme/post.html")
let feedTemplate = try Template(path: "theme/feed.html")
let tagTemplate = try Template(path: "theme/tag.html")
let tagsTemplate = try Template(path: "theme/tags.html")
let sitemapTemplate = try Template(path: "theme/sitemap.html")
let archivesTemplate = try Template(path: "theme/archives.html")


let context = Context(dictionary: [
  "site" : ["Name": config["name"].string!, "Description": config["description"].string!]
  ])

do {
  let rendered = try indexTemplate.render(context)
  print(rendered)
} catch {
  print("Failed to render template \(error)")
}


// create a markdown parser
var markdown = Markdown()

// loop through all files
// in v1, all content files are in single directory

for filename in Path("Content").glob("*.md") {
    var content = try String(contentsOfFile: String(filename), encoding: NSUTF8StringEncoding)
    var fileContents = content.componentsSeparatedByString("---")
    print(markdown.transform(fileContents[1]))
}
