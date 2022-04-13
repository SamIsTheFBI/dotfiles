const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1b1818", /* black   */
  [1] = "#D69E60", /* red     */
  [2] = "#61909E", /* green   */
  [3] = "#AE9F92", /* yellow  */
  [4] = "#D3B29D", /* blue    */
  [5] = "#EACFB2", /* magenta */
  [6] = "#BBBBC2", /* cyan    */
  [7] = "#ede6de", /* white   */

  /* 8 bright colors */
  [8]  = "#a5a19b",  /* black   */
  [9]  = "#D69E60",  /* red     */
  [10] = "#61909E", /* green   */
  [11] = "#AE9F92", /* yellow  */
  [12] = "#D3B29D", /* blue    */
  [13] = "#EACFB2", /* magenta */
  [14] = "#BBBBC2", /* cyan    */
  [15] = "#ede6de", /* white   */

  /* special colors */
  [256] = "#1b1818", /* background */
  [257] = "#ede6de", /* foreground */
  [258] = "#ede6de",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
