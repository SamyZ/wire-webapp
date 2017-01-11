#
# Wire
# Copyright (C) 2016 Wire Swiss GmbH
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see http://www.gnu.org/licenses/.
#

window.z ?= {}
z.calling ?= {}
z.calling.entities ?= {}

E_CALL_MESSAGE_CONFIG =
  VERSION: '3.0'

# E-call message entity.
class z.calling.entities.ECallPropSyncMessage extends z.calling.entities.ECallMessage
  ###
  Construct a new e-call setup message entity.
  @param response [Boolean] Is message a response, defaults to false
  @param props [Object] Additional properties
  @param e_call_et [z.calling.entities.ECall] Optional e-call the e-call message relates to
  ###
  constructor: (@response = false, @props, e_call_et) ->
    super z.calling.enum.E_CALL_MESSAGE_TYPE.PROP_SYNC, @response, e_call_et

  to_JSON: =>
    return {
      version: E_CALL_MESSAGE_CONFIG.VERSION
      props: @props
      resp: @response
      sessid: @sessid
      type: @type
    }

  to_content_string: =>
    return JSON.stringify @to_JSON()