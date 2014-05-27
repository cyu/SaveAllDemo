SaveAllDemo
===========

We believe that there is a design error with Parse's `saveAllInBackground:` methods, as they behave differently after failed requests as compared to saving a single object with the `saveInBackground:` methods.
The problem is that subsequent attempts to save an object with `saveAllInBackground:` after a failed request will save the object will all 'undefined' attributes. 

We have been told by a Parse/Facebook employee that on failure, `saveAllInBackground` will populate all the attributes of the would-be-saved objects with `nil`/`null` values purposely. Seeing that this is not the same behavior as the very similar `saveInBackground:` APIs, this is not well documented, and this is a commonly used API- we think this is an issue that needs to be addressed. 

This is a demo project that exemplifies our findings.
