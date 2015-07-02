require "awesome_print"
require "xmlrpc/client"

AwesomePrint.irb!

def rpc
  api = XMLRPC::Client.new("awseu3-productusertesting-b1.shared.cloud.spotify.net", "/RPC2", 6100)
  pu = XMLRPC::Client.new("awseu3-productusertesting-b1.shared.cloud.spotify.net", "/RPC2", 6101)
  d = XMLRPC::Client.new("awseu3-productusertesting-b1.shared.cloud.spotify.net", "/RPC2", 5120)

  @debug = api.proxy("debug")
  @offers = api.proxy("offers")
  @subscription = api.proxy("subscription")
  @user = pu.proxy("user")
  @system = pu.proxy("system")
  @payment = pu.proxy("payment")
  @pu_debug = d.proxy("debug")

  return @debug, @offers, @system, @payment, @pu_debug, @subscription
end

IRB.conf[:PROMPT][:MY_PROMPT] = { # name of prompt mode
  :AUTO_INDENT => true,            # enables auto-indent mode
  :PROMPT_I => "Console > ",               # normal prompt
  :PROMPT_S => "%03n:%i%l ",               # prompt for continuated strings
  :PROMPT_C => "%03n:%i* ",               # prompt for continuated statement
  :RETURN => "    ==>%s\n"        # format to return value
}
IRB.conf[:PROMPT_MODE] = :MY_PROMPT
