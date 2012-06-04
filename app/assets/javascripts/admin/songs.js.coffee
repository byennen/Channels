# $ ->
#   $("#file_upload").fileupload
#     forceIframeTransport: true
#     autoUpload: true
#     add: (event, data) ->
#       $.ajax
#         url: "/documents"
#         type: "POST"
#         dataType: "json"
#         data:
#           doc:
#             title: data.files[0].name

#         async: false
#         success: (retdata) ->
#           $("#file_upload").find("input[name=key]").val retdata.key
#           $("#file_upload").find("input[name=policy]").val retdata.policy
#           $("#file_upload").find("input[name=signature]").val retdata.signature

#       data.submit()

#     send: (e, data) ->
#       $("#loading").show()

#     fail: (e, data) ->
#       console.log "fail"
#       console.log data

#     done: (event, data) ->
#       $("#your_documents").load "/documents?for_item=1234"
#       $j("#loading").hide()
