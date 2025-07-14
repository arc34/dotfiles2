local xml_handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' 󰁂 %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

local default_handler = function(virtText, lnum, endLnum, width, truncate)
    -- Do not edit anything
    return virtText
end

local handler = function(virtText, lnum, endLnum, width, truncate)
  local ft = vim.bo.filetype
  if ft == 'xml' then
    return xml_handler(virtText, lnum, endLnum, width, truncate)
  else
    return default_handler(virtText, lnum, endLnum, width, truncate)
  end
end

return {
  -- https://github.com/kevinhwang91/nvim-ufo
  "kevinhwang91/nvim-ufo",
  dependencies = {
    -- https://github.com/kevinhwang91/promise-async
    "kevinhwang91/promise-async"
  },
  ft = { "xml" },
  config = function ()
    require('ufo').setup({
      fold_virt_text_handler = handler,
      provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
      end
    })
  end
}

