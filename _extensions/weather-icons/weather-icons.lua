local function ensureHTMLdeps()
  quarto.doc.add_html_dependency({
    name = "weather-icons",
    version = "0.1.0",
    stylesheets = {"css/weather-icons.min.css"}
  })
end

return {
  ['wi'] = function(args, kwargs)
    ensureHTMLdeps()
    local ii = ''
    for i, v in ipairs(args) do
      ii = ii .. ' ' .. pandoc.utils.stringify(v)
    end
    local icon = pandoc.utils.stringify(args[1])
    local out = '<i class="wi '  .. ii .. '"></i>'
    return pandoc.RawInline( 'html', out)
  end
}
