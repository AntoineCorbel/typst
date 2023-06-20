// todo: key this by the provided label or just use dependency injection
#let this-counter = counter("info-box")

#let info-box(
  title: none, 
  sections: none,
  label: none, 
  caption: none,
  radius: 3pt,
  inset: 16pt, 
  outset: 0pt, 
  fill: luma(45), 
) = {

  set block(spacing: 0pt)

  let title-radius = radius

  if sections != none {
    title-radius = (top: radius)
  }
  
  pad(
    y: inset,
    [
      #pad(
        x: outset,
        rect(
          width: 100%,
          inset: 0pt,
          stroke: fill,
          radius: radius,
          [
            #if title != none {
              block(
                width: 100%,
                radius: title-radius,
                fill: fill,
                pad(
                  inset,
                  par(
                    justify: false,
                    text(
                      hyphenate: false,
                      white, 
                      title
                    )
                  )
                )
              )
            }
            #if sections != none {
              let i = 0
              for section in sections {
                if i > 0 {
                  line(length: 100%)
                }
                pad(
                  inset,
                  section
                )
                i += 1
              }
            } 
          ]
        )
      )
    
      #if caption != none {
        align(
          center,
          pad(
            12pt,
            [
              #if label != none {
                label
              }
              #this-counter.display():
              #caption
            ]
          )
        )
        this-counter.step()
      }
    ]
  )
}