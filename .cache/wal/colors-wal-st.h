const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#09111c", /* black   */
  [1] = "#A86B54", /* red     */
  [2] = "#4B8975", /* green   */
  [3] = "#C6A06E", /* yellow  */
  [4] = "#1F7C81", /* blue    */
  [5] = "#298A86", /* magenta */
  [6] = "#5E9889", /* cyan    */
  [7] = "#a9e3c4", /* white   */

  /* 8 bright colors */
  [8]  = "#769e89",  /* black   */
  [9]  = "#A86B54",  /* red     */
  [10] = "#4B8975", /* green   */
  [11] = "#C6A06E", /* yellow  */
  [12] = "#1F7C81", /* blue    */
  [13] = "#298A86", /* magenta */
  [14] = "#5E9889", /* cyan    */
  [15] = "#a9e3c4", /* white   */

  /* special colors */
  [256] = "#09111c", /* background */
  [257] = "#a9e3c4", /* foreground */
  [258] = "#a9e3c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
