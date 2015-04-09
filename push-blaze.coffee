Items = new Meteor.Collection 'items'

if Meteor.isClient
  Template.hello.helpers
    list_items: ->
      Items.findOne {}

  Template.hello.events
    'click button': ->
      Items.update Items.findOne()._id,
        $push:
          list:
            $each: [
              foo: 2
            ]
            $position: 0

if Meteor.isServer
  Meteor.startup ->
    Items.remove {}
    Items.insert
      list: [
        foo: 1
      ]
