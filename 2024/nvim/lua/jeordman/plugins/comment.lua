local setup, comment = pcall(require, "Comment")
if not setup then 
  return
end

comment.setup({
   pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})
