#' Function to Annotate the visualized ggplot.
#'
#' @param data a dataframe
#' @inheritParams ggplot2::layer
#' @param na.rm specifies how default missing values are approached
#' @param ... additional parameters
#'
#' @return ggplot with timeline of the earthquake and the location of the same annotated
#'
#' @import ggplot2
#'
#' @examples
#' \dontrun{
#' data = system.file('extdata', 'earthquakesData.tsv', package ='masteringSoftwareDevelopmentinR') %>%
#' data = read_data(data) %>%
#' eq_clean_data() %>%
#' dplyr::filter(datetime >= "1980-01-01" & datetime <="2014-01-01" & COUNTRY == c("BRAZIL"))%>%
#' ggplot() +
#' geom_timeline_label(aes(x = (datetime, location_name),
#' size = EQ_MAG_ML, color = DEATHS, fill = DEATHS))
#' }
#'
#' @export
#'


geom_timeline_label <- function(mapping = NULL,data = NULL, na.rm = TRUE,show.legend = NA,
                                stat = "identity",position = "identity",inherit.aes = TRUE, ...) {

                                                ggplot2::layer(geom = GeomTimeLineLabel,mapping = mapping,
                                                              data = data,stat = stat,position = position,
                                                              show.legend = show.legend,inherit.aes = inherit.aes,
                                                              params = list(na.rm = na.rm, ...))
}


GeomTimeLineLabel <- ggplot2::ggproto("GeomTimeLineLabel", ggplot2::Geom,
                                        required_aes = c("x", "tags"),default_aes = ggplot2::aes(y = 0.5,
                                        number = NULL, max_aes = NULL),

                                                  draw_key = ggplot2::draw_key_point,

                                                  draw_panel = function(data, panel_scales, coord) {

                                                  coords <- coord$transform(data, panel_scales)
                                                  coords$size <-coords$size / max(coords$size) * 1.5

                                                  Timeline_seg_grobs <- grid::segmentsGrob(x0 = grid::unit(coords$x, "npc"),
                                                                                            y0 = grid::unit(coords$y, "npc"),
                                                                                            x1 = grid::unit(coords$x, "npc"),
                                                                                            y1 = grid::unit(coords$y + 0.06/length(unique(coords$y)), "npc"),
                                                                                            default.units = "npc",
                                                                                            arrow = NULL,
                                                                                            name = NULL,
                                                                                            gp = grid::gpar(),
                                                                                            vp = NULL)

                                                       Earthquake_text_grobs <- grid::textGrob(label = coords$tags,
                                                                                               x = unit(coords$x, "npc"),
                                                                                               y = unit(coords$y + 0.06/length(unique(coords$y)), "npc"),
                                                                                               rot = 60,
                                                                                               just = "left",
                                                                                               gp = grid::gpar(fontsize = 8))

                                             grid::gTree(children = grid::gList(Timeline_seg_grobs, Earthquake_text_grobs))
                                           }
)
