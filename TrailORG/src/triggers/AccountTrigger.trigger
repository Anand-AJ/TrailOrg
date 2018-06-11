trigger AccountTrigger on Account (after update) {
    if(trigger.isafter)
    {
        if(trigger.IsUpdate)
        {
           AccountTriggerHelper.updateContact(Trigger.NewMap.KeySet());
        }
    }

}