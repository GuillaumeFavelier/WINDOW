#include <GL/gl.h>
#include <GL/glu.h>
#include <SDL/SDL.h>
#include <unistd.h>

int main(){
  SDL_Init(0x00000020);

  SDL_SetVideoMode(800,600,32,0x40000003);

  SDL_WM_SetCaption("SDL-GL-Test", 0);

  glClear(0x00000020);

  glBegin(0X0004);
  glColor3d(255,0,0);
  glVertex3d(1,-1,0);

  glColor3d(0,255,0);
  glVertex3d(-1,0,0);

  glColor3d(0,0,255);
  glVertex3d(1,1,0);
  glEnd();

  glFlush();
  SDL_GL_SwapBuffers();

  sleep(5);

  SDL_Quit();
  return 0;
}
