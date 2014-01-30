-- Generated with C preprocessor cpp
-- In the plplot directory:
--     mkdir build
--     cd build
--     cmake ..
--     make
--     cd ../include
--     cpp -I../build/include -I. -P plplot.h > c_api.h
--     gcc -E -dM -I../build/include -I. -P plplot.h | grep PLESC > c_defines.h

local ffi = require 'ffi'

ffi.cdef[[
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef short __int16_t;
typedef unsigned short __uint16_t;
typedef int __int32_t;
typedef unsigned int __uint32_t;
typedef long long __int64_t;
typedef unsigned long long __uint64_t;
typedef long __darwin_intptr_t;
typedef unsigned int __darwin_natural_t;
typedef int __darwin_ct_rune_t;
typedef union {
 char __mbstate8[128];
 long long _mbstateL;
} __mbstate_t;
typedef __mbstate_t __darwin_mbstate_t;
typedef long int __darwin_ptrdiff_t;
typedef long unsigned int __darwin_size_t;
typedef __builtin_va_list __darwin_va_list;
typedef int __darwin_wchar_t;
typedef __darwin_wchar_t __darwin_rune_t;
typedef int __darwin_wint_t;
typedef unsigned long __darwin_clock_t;
typedef __uint32_t __darwin_socklen_t;
typedef long __darwin_ssize_t;
typedef long __darwin_time_t;
struct __darwin_pthread_handler_rec
{
 void (*__routine)(void *);
 void *__arg;
 struct __darwin_pthread_handler_rec *__next;
};
struct _opaque_pthread_attr_t { long __sig; char __opaque[56]; };
struct _opaque_pthread_cond_t { long __sig; char __opaque[40]; };
struct _opaque_pthread_condattr_t { long __sig; char __opaque[8]; };
struct _opaque_pthread_mutex_t { long __sig; char __opaque[56]; };
struct _opaque_pthread_mutexattr_t { long __sig; char __opaque[8]; };
struct _opaque_pthread_once_t { long __sig; char __opaque[8]; };
struct _opaque_pthread_rwlock_t { long __sig; char __opaque[192]; };
struct _opaque_pthread_rwlockattr_t { long __sig; char __opaque[16]; };
struct _opaque_pthread_t { long __sig; struct __darwin_pthread_handler_rec *__cleanup_stack; char __opaque[1168]; };
typedef __int64_t __darwin_blkcnt_t;
typedef __int32_t __darwin_blksize_t;
typedef __int32_t __darwin_dev_t;
typedef unsigned int __darwin_fsblkcnt_t;
typedef unsigned int __darwin_fsfilcnt_t;
typedef __uint32_t __darwin_gid_t;
typedef __uint32_t __darwin_id_t;
typedef __uint64_t __darwin_ino64_t;
typedef __darwin_ino64_t __darwin_ino_t;
typedef __darwin_natural_t __darwin_mach_port_name_t;
typedef __darwin_mach_port_name_t __darwin_mach_port_t;
typedef __uint16_t __darwin_mode_t;
typedef __int64_t __darwin_off_t;
typedef __int32_t __darwin_pid_t;
typedef struct _opaque_pthread_attr_t
   __darwin_pthread_attr_t;
typedef struct _opaque_pthread_cond_t
   __darwin_pthread_cond_t;
typedef struct _opaque_pthread_condattr_t
   __darwin_pthread_condattr_t;
typedef unsigned long __darwin_pthread_key_t;
typedef struct _opaque_pthread_mutex_t
   __darwin_pthread_mutex_t;
typedef struct _opaque_pthread_mutexattr_t
   __darwin_pthread_mutexattr_t;
typedef struct _opaque_pthread_once_t
   __darwin_pthread_once_t;
typedef struct _opaque_pthread_rwlock_t
   __darwin_pthread_rwlock_t;
typedef struct _opaque_pthread_rwlockattr_t
   __darwin_pthread_rwlockattr_t;
typedef struct _opaque_pthread_t
   *__darwin_pthread_t;
typedef __uint32_t __darwin_sigset_t;
typedef __int32_t __darwin_suseconds_t;
typedef __uint32_t __darwin_uid_t;
typedef __uint32_t __darwin_useconds_t;
typedef unsigned char __darwin_uuid_t[16];
typedef char __darwin_uuid_string_t[37];
typedef int __darwin_nl_item;
typedef int __darwin_wctrans_t;
typedef __uint32_t __darwin_wctype_t;
typedef __darwin_va_list va_list;
typedef __darwin_size_t size_t;

typedef __darwin_off_t fpos_t;
struct __sbuf {
 unsigned char *_base;
 int _size;
};
struct __sFILEX;
typedef struct __sFILE {
 unsigned char *_p;
 int _r;
 int _w;
 short _flags;
 short _file;
 struct __sbuf _bf;
 int _lbfsize;
 void *_cookie;
 int (*_close)(void *);
 int (*_read) (void *, char *, int);
 fpos_t (*_seek) (void *, fpos_t, int);
 int (*_write)(void *, const char *, int);
 struct __sbuf _ub;
 struct __sFILEX *_extra;
 int _ur;
 unsigned char _ubuf[3];
 unsigned char _nbuf[1];
 struct __sbuf _lb;
 int _blksize;
 fpos_t _offset;
} FILE;

extern FILE *__stdinp;
extern FILE *__stdoutp;
extern FILE *__stderrp;


void clearerr(FILE *);
int fclose(FILE *);
int feof(FILE *);
int ferror(FILE *);
int fflush(FILE *);
int fgetc(FILE *);
int fgetpos(FILE * , fpos_t *);
char *fgets(char * , int, FILE *);
FILE *fopen(const char * , const char * ) __asm("_" "fopen" );
int fprintf(FILE * , const char * , ...) __attribute__((__format__ (__printf__, 2, 3)));
int fputc(int, FILE *);
int fputs(const char * , FILE * ) __asm("_" "fputs" );
size_t fread(void * , size_t, size_t, FILE * );
FILE *freopen(const char * , const char * ,
                 FILE * ) __asm("_" "freopen" );
int fscanf(FILE * , const char * , ...) __attribute__((__format__ (__scanf__, 2, 3)));
int fseek(FILE *, long, int);
int fsetpos(FILE *, const fpos_t *);
long ftell(FILE *);
size_t fwrite(const void * , size_t, size_t, FILE * ) __asm("_" "fwrite" );
int getc(FILE *);
int getchar(void);
char *gets(char *);
void perror(const char *);
int printf(const char * , ...) __attribute__((__format__ (__printf__, 1, 2)));
int putc(int, FILE *);
int putchar(int);
int puts(const char *);
int remove(const char *);
int rename (const char *, const char *);
void rewind(FILE *);
int scanf(const char * , ...) __attribute__((__format__ (__scanf__, 1, 2)));
void setbuf(FILE * , char * );
int setvbuf(FILE * , char * , int, size_t);
int sprintf(char * , const char * , ...) __attribute__((__format__ (__printf__, 2, 3)));
int sscanf(const char * , const char * , ...) __attribute__((__format__ (__scanf__, 2, 3)));
FILE *tmpfile(void);
char *tmpnam(char *);
int ungetc(int, FILE *);
int vfprintf(FILE * , const char * , va_list) __attribute__((__format__ (__printf__, 2, 0)));
int vprintf(const char * , va_list) __attribute__((__format__ (__printf__, 1, 0)));
int vsprintf(char * , const char * , va_list) __attribute__((__format__ (__printf__, 2, 0)));


char *ctermid(char *);
FILE *fdopen(int, const char *) __asm("_" "fdopen" );
int fileno(FILE *);


int pclose(FILE *);
FILE *popen(const char *, const char *) __asm("_" "popen" );


int __srget(FILE *);
int __svfscanf(FILE *, const char *, va_list) __attribute__((__format__ (__scanf__, 2, 0)));
int __swbuf(int, FILE *);

static __inline int __sputc(int _c, FILE *_p) {
 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf(_c, _p));
}

void flockfile(FILE *);
int ftrylockfile(FILE *);
void funlockfile(FILE *);
int getc_unlocked(FILE *);
int getchar_unlocked(void);
int putc_unlocked(int, FILE *);
int putchar_unlocked(int);
int getw(FILE *);
int putw(int, FILE *);
char *tempnam(const char *, const char *) __asm("_" "tempnam" );

typedef __darwin_off_t off_t;

int fseeko(FILE *, off_t, int);
off_t ftello(FILE *);


int snprintf(char * , size_t, const char * , ...) __attribute__((__format__ (__printf__, 3, 4)));
int vfscanf(FILE * , const char * , va_list) __attribute__((__format__ (__scanf__, 2, 0)));
int vscanf(const char * , va_list) __attribute__((__format__ (__scanf__, 1, 0)));
int vsnprintf(char * , size_t, const char * , va_list) __attribute__((__format__ (__printf__, 3, 0)));
int vsscanf(const char * , const char * , va_list) __attribute__((__format__ (__scanf__, 2, 0)));

typedef __darwin_ssize_t ssize_t;

int dprintf(int, const char * , ...) __attribute__((__format__ (__printf__, 2, 3))) __attribute__((visibility("default")));
int vdprintf(int, const char * , va_list) __attribute__((__format__ (__printf__, 2, 0))) __attribute__((visibility("default")));
ssize_t getdelim(char ** , size_t * , int, FILE * ) __attribute__((visibility("default")));
ssize_t getline(char ** , size_t * , FILE * ) __attribute__((visibility("default")));


extern const int sys_nerr;
extern const char *const sys_errlist[];
int asprintf(char **, const char *, ...) __attribute__((__format__ (__printf__, 2, 3)));
char *ctermid_r(char *);
char *fgetln(FILE *, size_t *);
const char *fmtcheck(const char *, const char *);
int fpurge(FILE *);
void setbuffer(FILE *, char *, int);
int setlinebuf(FILE *);
int vasprintf(char **, const char *, va_list) __attribute__((__format__ (__printf__, 2, 0)));
FILE *zopen(const char *, const char *, int);
FILE *funopen(const void *,
                 int (*)(void *, char *, int),
                 int (*)(void *, const char *, int),
                 fpos_t (*)(void *, fpos_t, int),
                 int (*)(void *));

extern int __sprintf_chk (char * , int, size_t,
     const char * , ...);
extern int __snprintf_chk (char * , size_t, int, size_t,
      const char * , ...);
extern int __vsprintf_chk (char * , int, size_t,
      const char * , va_list);
extern int __vsnprintf_chk (char * , size_t, int, size_t,
       const char * , va_list);
typedef enum {
 P_ALL,
 P_PID,
 P_PGID
} idtype_t;
typedef __darwin_pid_t pid_t;
typedef __darwin_id_t id_t;
typedef int sig_atomic_t;
struct __darwin_i386_thread_state
{
    unsigned int __eax;
    unsigned int __ebx;
    unsigned int __ecx;
    unsigned int __edx;
    unsigned int __edi;
    unsigned int __esi;
    unsigned int __ebp;
    unsigned int __esp;
    unsigned int __ss;
    unsigned int __eflags;
    unsigned int __eip;
    unsigned int __cs;
    unsigned int __ds;
    unsigned int __es;
    unsigned int __fs;
    unsigned int __gs;
};
struct __darwin_fp_control
{
    unsigned short __invalid :1,
        __denorm :1,
    __zdiv :1,
    __ovrfl :1,
    __undfl :1,
    __precis :1,
      :2,
    __pc :2,
    __rc :2,
             :1,
      :3;
};
typedef struct __darwin_fp_control __darwin_fp_control_t;
struct __darwin_fp_status
{
    unsigned short __invalid :1,
        __denorm :1,
    __zdiv :1,
    __ovrfl :1,
    __undfl :1,
    __precis :1,
    __stkflt :1,
    __errsumm :1,
    __c0 :1,
    __c1 :1,
    __c2 :1,
    __tos :3,
    __c3 :1,
    __busy :1;
};
typedef struct __darwin_fp_status __darwin_fp_status_t;
struct __darwin_mmst_reg
{
 char __mmst_reg[10];
 char __mmst_rsrv[6];
};
struct __darwin_xmm_reg
{
 char __xmm_reg[16];
};
struct __darwin_i386_float_state
{
 int __fpu_reserved[2];
 struct __darwin_fp_control __fpu_fcw;
 struct __darwin_fp_status __fpu_fsw;
 __uint8_t __fpu_ftw;
 __uint8_t __fpu_rsrv1;
 __uint16_t __fpu_fop;
 __uint32_t __fpu_ip;
 __uint16_t __fpu_cs;
 __uint16_t __fpu_rsrv2;
 __uint32_t __fpu_dp;
 __uint16_t __fpu_ds;
 __uint16_t __fpu_rsrv3;
 __uint32_t __fpu_mxcsr;
 __uint32_t __fpu_mxcsrmask;
 struct __darwin_mmst_reg __fpu_stmm0;
 struct __darwin_mmst_reg __fpu_stmm1;
 struct __darwin_mmst_reg __fpu_stmm2;
 struct __darwin_mmst_reg __fpu_stmm3;
 struct __darwin_mmst_reg __fpu_stmm4;
 struct __darwin_mmst_reg __fpu_stmm5;
 struct __darwin_mmst_reg __fpu_stmm6;
 struct __darwin_mmst_reg __fpu_stmm7;
 struct __darwin_xmm_reg __fpu_xmm0;
 struct __darwin_xmm_reg __fpu_xmm1;
 struct __darwin_xmm_reg __fpu_xmm2;
 struct __darwin_xmm_reg __fpu_xmm3;
 struct __darwin_xmm_reg __fpu_xmm4;
 struct __darwin_xmm_reg __fpu_xmm5;
 struct __darwin_xmm_reg __fpu_xmm6;
 struct __darwin_xmm_reg __fpu_xmm7;
 char __fpu_rsrv4[14*16];
 int __fpu_reserved1;
};
struct __darwin_i386_avx_state
{
 int __fpu_reserved[2];
 struct __darwin_fp_control __fpu_fcw;
 struct __darwin_fp_status __fpu_fsw;
 __uint8_t __fpu_ftw;
 __uint8_t __fpu_rsrv1;
 __uint16_t __fpu_fop;
 __uint32_t __fpu_ip;
 __uint16_t __fpu_cs;
 __uint16_t __fpu_rsrv2;
 __uint32_t __fpu_dp;
 __uint16_t __fpu_ds;
 __uint16_t __fpu_rsrv3;
 __uint32_t __fpu_mxcsr;
 __uint32_t __fpu_mxcsrmask;
 struct __darwin_mmst_reg __fpu_stmm0;
 struct __darwin_mmst_reg __fpu_stmm1;
 struct __darwin_mmst_reg __fpu_stmm2;
 struct __darwin_mmst_reg __fpu_stmm3;
 struct __darwin_mmst_reg __fpu_stmm4;
 struct __darwin_mmst_reg __fpu_stmm5;
 struct __darwin_mmst_reg __fpu_stmm6;
 struct __darwin_mmst_reg __fpu_stmm7;
 struct __darwin_xmm_reg __fpu_xmm0;
 struct __darwin_xmm_reg __fpu_xmm1;
 struct __darwin_xmm_reg __fpu_xmm2;
 struct __darwin_xmm_reg __fpu_xmm3;
 struct __darwin_xmm_reg __fpu_xmm4;
 struct __darwin_xmm_reg __fpu_xmm5;
 struct __darwin_xmm_reg __fpu_xmm6;
 struct __darwin_xmm_reg __fpu_xmm7;
 char __fpu_rsrv4[14*16];
 int __fpu_reserved1;
 char __avx_reserved1[64];
 struct __darwin_xmm_reg __fpu_ymmh0;
 struct __darwin_xmm_reg __fpu_ymmh1;
 struct __darwin_xmm_reg __fpu_ymmh2;
 struct __darwin_xmm_reg __fpu_ymmh3;
 struct __darwin_xmm_reg __fpu_ymmh4;
 struct __darwin_xmm_reg __fpu_ymmh5;
 struct __darwin_xmm_reg __fpu_ymmh6;
 struct __darwin_xmm_reg __fpu_ymmh7;
};
struct __darwin_i386_exception_state
{
 __uint16_t __trapno;
 __uint16_t __cpu;
 __uint32_t __err;
 __uint32_t __faultvaddr;
};
struct __darwin_x86_debug_state32
{
 unsigned int __dr0;
 unsigned int __dr1;
 unsigned int __dr2;
 unsigned int __dr3;
 unsigned int __dr4;
 unsigned int __dr5;
 unsigned int __dr6;
 unsigned int __dr7;
};
struct __darwin_x86_thread_state64
{
 __uint64_t __rax;
 __uint64_t __rbx;
 __uint64_t __rcx;
 __uint64_t __rdx;
 __uint64_t __rdi;
 __uint64_t __rsi;
 __uint64_t __rbp;
 __uint64_t __rsp;
 __uint64_t __r8;
 __uint64_t __r9;
 __uint64_t __r10;
 __uint64_t __r11;
 __uint64_t __r12;
 __uint64_t __r13;
 __uint64_t __r14;
 __uint64_t __r15;
 __uint64_t __rip;
 __uint64_t __rflags;
 __uint64_t __cs;
 __uint64_t __fs;
 __uint64_t __gs;
};
struct __darwin_x86_float_state64
{
 int __fpu_reserved[2];
 struct __darwin_fp_control __fpu_fcw;
 struct __darwin_fp_status __fpu_fsw;
 __uint8_t __fpu_ftw;
 __uint8_t __fpu_rsrv1;
 __uint16_t __fpu_fop;
 __uint32_t __fpu_ip;
 __uint16_t __fpu_cs;
 __uint16_t __fpu_rsrv2;
 __uint32_t __fpu_dp;
 __uint16_t __fpu_ds;
 __uint16_t __fpu_rsrv3;
 __uint32_t __fpu_mxcsr;
 __uint32_t __fpu_mxcsrmask;
 struct __darwin_mmst_reg __fpu_stmm0;
 struct __darwin_mmst_reg __fpu_stmm1;
 struct __darwin_mmst_reg __fpu_stmm2;
 struct __darwin_mmst_reg __fpu_stmm3;
 struct __darwin_mmst_reg __fpu_stmm4;
 struct __darwin_mmst_reg __fpu_stmm5;
 struct __darwin_mmst_reg __fpu_stmm6;
 struct __darwin_mmst_reg __fpu_stmm7;
 struct __darwin_xmm_reg __fpu_xmm0;
 struct __darwin_xmm_reg __fpu_xmm1;
 struct __darwin_xmm_reg __fpu_xmm2;
 struct __darwin_xmm_reg __fpu_xmm3;
 struct __darwin_xmm_reg __fpu_xmm4;
 struct __darwin_xmm_reg __fpu_xmm5;
 struct __darwin_xmm_reg __fpu_xmm6;
 struct __darwin_xmm_reg __fpu_xmm7;
 struct __darwin_xmm_reg __fpu_xmm8;
 struct __darwin_xmm_reg __fpu_xmm9;
 struct __darwin_xmm_reg __fpu_xmm10;
 struct __darwin_xmm_reg __fpu_xmm11;
 struct __darwin_xmm_reg __fpu_xmm12;
 struct __darwin_xmm_reg __fpu_xmm13;
 struct __darwin_xmm_reg __fpu_xmm14;
 struct __darwin_xmm_reg __fpu_xmm15;
 char __fpu_rsrv4[6*16];
 int __fpu_reserved1;
};
struct __darwin_x86_avx_state64
{
 int __fpu_reserved[2];
 struct __darwin_fp_control __fpu_fcw;
 struct __darwin_fp_status __fpu_fsw;
 __uint8_t __fpu_ftw;
 __uint8_t __fpu_rsrv1;
 __uint16_t __fpu_fop;
 __uint32_t __fpu_ip;
 __uint16_t __fpu_cs;
 __uint16_t __fpu_rsrv2;
 __uint32_t __fpu_dp;
 __uint16_t __fpu_ds;
 __uint16_t __fpu_rsrv3;
 __uint32_t __fpu_mxcsr;
 __uint32_t __fpu_mxcsrmask;
 struct __darwin_mmst_reg __fpu_stmm0;
 struct __darwin_mmst_reg __fpu_stmm1;
 struct __darwin_mmst_reg __fpu_stmm2;
 struct __darwin_mmst_reg __fpu_stmm3;
 struct __darwin_mmst_reg __fpu_stmm4;
 struct __darwin_mmst_reg __fpu_stmm5;
 struct __darwin_mmst_reg __fpu_stmm6;
 struct __darwin_mmst_reg __fpu_stmm7;
 struct __darwin_xmm_reg __fpu_xmm0;
 struct __darwin_xmm_reg __fpu_xmm1;
 struct __darwin_xmm_reg __fpu_xmm2;
 struct __darwin_xmm_reg __fpu_xmm3;
 struct __darwin_xmm_reg __fpu_xmm4;
 struct __darwin_xmm_reg __fpu_xmm5;
 struct __darwin_xmm_reg __fpu_xmm6;
 struct __darwin_xmm_reg __fpu_xmm7;
 struct __darwin_xmm_reg __fpu_xmm8;
 struct __darwin_xmm_reg __fpu_xmm9;
 struct __darwin_xmm_reg __fpu_xmm10;
 struct __darwin_xmm_reg __fpu_xmm11;
 struct __darwin_xmm_reg __fpu_xmm12;
 struct __darwin_xmm_reg __fpu_xmm13;
 struct __darwin_xmm_reg __fpu_xmm14;
 struct __darwin_xmm_reg __fpu_xmm15;
 char __fpu_rsrv4[6*16];
 int __fpu_reserved1;
 char __avx_reserved1[64];
 struct __darwin_xmm_reg __fpu_ymmh0;
 struct __darwin_xmm_reg __fpu_ymmh1;
 struct __darwin_xmm_reg __fpu_ymmh2;
 struct __darwin_xmm_reg __fpu_ymmh3;
 struct __darwin_xmm_reg __fpu_ymmh4;
 struct __darwin_xmm_reg __fpu_ymmh5;
 struct __darwin_xmm_reg __fpu_ymmh6;
 struct __darwin_xmm_reg __fpu_ymmh7;
 struct __darwin_xmm_reg __fpu_ymmh8;
 struct __darwin_xmm_reg __fpu_ymmh9;
 struct __darwin_xmm_reg __fpu_ymmh10;
 struct __darwin_xmm_reg __fpu_ymmh11;
 struct __darwin_xmm_reg __fpu_ymmh12;
 struct __darwin_xmm_reg __fpu_ymmh13;
 struct __darwin_xmm_reg __fpu_ymmh14;
 struct __darwin_xmm_reg __fpu_ymmh15;
};
struct __darwin_x86_exception_state64
{
    __uint16_t __trapno;
    __uint16_t __cpu;
    __uint32_t __err;
    __uint64_t __faultvaddr;
};
struct __darwin_x86_debug_state64
{
 __uint64_t __dr0;
 __uint64_t __dr1;
 __uint64_t __dr2;
 __uint64_t __dr3;
 __uint64_t __dr4;
 __uint64_t __dr5;
 __uint64_t __dr6;
 __uint64_t __dr7;
};
struct __darwin_mcontext32
{
 struct __darwin_i386_exception_state __es;
 struct __darwin_i386_thread_state __ss;
 struct __darwin_i386_float_state __fs;
};
struct __darwin_mcontext_avx32
{
 struct __darwin_i386_exception_state __es;
 struct __darwin_i386_thread_state __ss;
 struct __darwin_i386_avx_state __fs;
};
struct __darwin_mcontext64
{
 struct __darwin_x86_exception_state64 __es;
 struct __darwin_x86_thread_state64 __ss;
 struct __darwin_x86_float_state64 __fs;
};
struct __darwin_mcontext_avx64
{
 struct __darwin_x86_exception_state64 __es;
 struct __darwin_x86_thread_state64 __ss;
 struct __darwin_x86_avx_state64 __fs;
};
typedef struct __darwin_mcontext64 *mcontext_t;
struct __darwin_sigaltstack
{
 void *ss_sp;
 __darwin_size_t ss_size;
 int ss_flags;
};
struct __darwin_ucontext
{
 int uc_onstack;
 __darwin_sigset_t uc_sigmask;
 struct __darwin_sigaltstack uc_stack;
 struct __darwin_ucontext *uc_link;
 __darwin_size_t uc_mcsize;
 struct __darwin_mcontext64 *uc_mcontext;
};
typedef struct __darwin_sigaltstack stack_t;
typedef struct __darwin_ucontext ucontext_t;
typedef __darwin_pthread_attr_t pthread_attr_t;
typedef __darwin_sigset_t sigset_t;
typedef __darwin_uid_t uid_t;
union sigval {
 int sival_int;
 void *sival_ptr;
};
struct sigevent {
 int sigev_notify;
 int sigev_signo;
 union sigval sigev_value;
 void (*sigev_notify_function)(union sigval);
 pthread_attr_t *sigev_notify_attributes;
};
typedef struct __siginfo {
 int si_signo;
 int si_errno;
 int si_code;
 pid_t si_pid;
 uid_t si_uid;
 int si_status;
 void *si_addr;
 union sigval si_value;
 long si_band;
 unsigned long __pad[7];
} siginfo_t;
union __sigaction_u {
 void (*__sa_handler)(int);
 void (*__sa_sigaction)(int, struct __siginfo *,
         void *);
};
struct __sigaction {
 union __sigaction_u __sigaction_u;
 void (*sa_tramp)(void *, int, int, siginfo_t *, void *);
 sigset_t sa_mask;
 int sa_flags;
};
struct sigaction {
 union __sigaction_u __sigaction_u;
 sigset_t sa_mask;
 int sa_flags;
};
typedef void (*sig_t)(int);
struct sigvec {
 void (*sv_handler)(int);
 int sv_mask;
 int sv_flags;
};
struct sigstack {
 char *ss_sp;
 int ss_onstack;
};

void (*signal(int, void (*)(int)))(int);

struct timeval
{
 __darwin_time_t tv_sec;
 __darwin_suseconds_t tv_usec;
};
typedef __uint64_t rlim_t;
struct rusage {
 struct timeval ru_utime;
 struct timeval ru_stime;
 long ru_maxrss;
 long ru_ixrss;
 long ru_idrss;
 long ru_isrss;
 long ru_minflt;
 long ru_majflt;
 long ru_nswap;
 long ru_inblock;
 long ru_oublock;
 long ru_msgsnd;
 long ru_msgrcv;
 long ru_nsignals;
 long ru_nvcsw;
 long ru_nivcsw;
};
struct rlimit {
 rlim_t rlim_cur;
 rlim_t rlim_max;
};

int getpriority(int, id_t);
int getiopolicy_np(int, int) __attribute__((visibility("default")));
int getrlimit(int, struct rlimit *) __asm("_" "getrlimit" );
int getrusage(int, struct rusage *);
int setpriority(int, id_t, int);
int setiopolicy_np(int, int, int) __attribute__((visibility("default")));
int setrlimit(int, const struct rlimit *) __asm("_" "setrlimit" );

static __inline__
__uint16_t
_OSSwapInt16(
    __uint16_t _data
)
{
    return ((_data << 8) | (_data >> 8));
}
static __inline__
__uint32_t
_OSSwapInt32(
    __uint32_t _data
)
{
    return __builtin_bswap32(_data);
}
static __inline__
__uint64_t
_OSSwapInt64(
    __uint64_t _data
)
{
    return __builtin_bswap64(_data);
}
union wait {
 int w_status;
 struct {
  unsigned int w_Termsig:7,
    w_Coredump:1,
    w_Retcode:8,
    w_Filler:16;
 } w_T;
 struct {
  unsigned int w_Stopval:8,
    w_Stopsig:8,
    w_Filler:16;
 } w_S;
};

pid_t wait(int *) __asm("_" "wait" );
pid_t waitpid(pid_t, int *, int) __asm("_" "waitpid" );
int waitid(idtype_t, id_t, siginfo_t *, int) __asm("_" "waitid" );
pid_t wait3(int *, int, struct rusage *);
pid_t wait4(pid_t, int *, int, struct rusage *);


void *alloca(size_t);

typedef __darwin_ct_rune_t ct_rune_t;
typedef __darwin_rune_t rune_t;
typedef __darwin_wchar_t wchar_t;
typedef struct {
 int quot;
 int rem;
} div_t;
typedef struct {
 long quot;
 long rem;
} ldiv_t;
typedef struct {
 long long quot;
 long long rem;
} lldiv_t;
extern int __mb_cur_max;

void abort(void) __attribute__((noreturn));
int abs(int) __attribute__((const));
int atexit(void (*)(void));
double atof(const char *);
int atoi(const char *);
long atol(const char *);
long long
  atoll(const char *);
void *bsearch(const void *, const void *, size_t,
     size_t, int (*)(const void *, const void *));
void *calloc(size_t, size_t);
div_t div(int, int) __attribute__((const));
void exit(int) __attribute__((noreturn));
void free(void *);
char *getenv(const char *);
long labs(long) __attribute__((const));
ldiv_t ldiv(long, long) __attribute__((const));
long long
  llabs(long long);
lldiv_t lldiv(long long, long long);
void *malloc(size_t);
int mblen(const char *, size_t);
size_t mbstowcs(wchar_t * , const char * , size_t);
int mbtowc(wchar_t * , const char * , size_t);
int posix_memalign(void **, size_t, size_t) __attribute__((visibility("default")));
void qsort(void *, size_t, size_t,
     int (*)(const void *, const void *));
int rand(void);
void *realloc(void *, size_t);
void srand(unsigned);
double strtod(const char *, char **) __asm("_" "strtod" );
float strtof(const char *, char **) __asm("_" "strtof" );
long strtol(const char *, char **, int);
long double
  strtold(const char *, char **);
long long
  strtoll(const char *, char **, int);
unsigned long
  strtoul(const char *, char **, int);
unsigned long long
  strtoull(const char *, char **, int);
int system(const char *) __asm("_" "system" );
size_t wcstombs(char * , const wchar_t * , size_t);
int wctomb(char *, wchar_t);
void _Exit(int) __attribute__((noreturn));
long a64l(const char *);
double drand48(void);
char *ecvt(double, int, int *, int *);
double erand48(unsigned short[3]);
char *fcvt(double, int, int *, int *);
char *gcvt(double, int, char *);
int getsubopt(char **, char * const *, char **);
int grantpt(int);
char *initstate(unsigned, char *, size_t);
long jrand48(unsigned short[3]);
char *l64a(long);
void lcong48(unsigned short[7]);
long lrand48(void);
char *mktemp(char *);
int mkstemp(char *);
long mrand48(void);
long nrand48(unsigned short[3]);
int posix_openpt(int);
char *ptsname(int);
int putenv(char *) __asm("_" "putenv" );
long random(void);
int rand_r(unsigned *);
char *realpath(const char * , char * ) __asm("_" "realpath" "$DARWIN_EXTSN");
unsigned short
 *seed48(unsigned short[3]);
int setenv(const char *, const char *, int) __asm("_" "setenv" );
void setkey(const char *) __asm("_" "setkey" );
char *setstate(const char *);
void srand48(long);
void srandom(unsigned);
int unlockpt(int);
int unsetenv(const char *) __asm("_" "unsetenv" );
typedef signed char int8_t;
typedef unsigned char u_int8_t;
typedef short int16_t;
typedef unsigned short u_int16_t;
typedef int int32_t;
typedef unsigned int u_int32_t;
typedef long long int64_t;
typedef unsigned long long u_int64_t;
typedef int64_t register_t;
typedef __darwin_intptr_t intptr_t;
typedef unsigned long uintptr_t;
typedef u_int64_t user_addr_t;
typedef u_int64_t user_size_t;
typedef int64_t user_ssize_t;
typedef int64_t user_long_t;
typedef u_int64_t user_ulong_t;
typedef int64_t user_time_t;
typedef int64_t user_off_t;
typedef u_int64_t syscall_arg_t;
typedef __darwin_dev_t dev_t;
typedef __darwin_mode_t mode_t;
u_int32_t
  arc4random(void);
void arc4random_addrandom(unsigned char * , int );
void arc4random_buf(void * , size_t ) __attribute__((visibility("default")));
void arc4random_stir(void);
u_int32_t
  arc4random_uniform(u_int32_t ) __attribute__((visibility("default")));
/*int atexit_b(void (^)(void)) __attribute__((visibility("default")));
void *bsearch_b(const void *, const void *, size_t,
     size_t, int (^)(const void *, const void *)) __attribute__((visibility("default")));*/
char *cgetcap(char *, const char *, int);
int cgetclose(void);
int cgetent(char **, char **, const char *);
int cgetfirst(char **, char **);
int cgetmatch(const char *, const char *);
int cgetnext(char **, char **);
int cgetnum(char *, const char *, long *);
int cgetset(const char *);
int cgetstr(char *, const char *, char **);
int cgetustr(char *, const char *, char **);
int daemon(int, int) __asm("_" "daemon" "$1050") __attribute__((deprecated,visibility("default")));
char *devname(dev_t, mode_t);
char *devname_r(dev_t, mode_t, char *buf, int len);
char *getbsize(int *, long *);
int getloadavg(double [], int);
const char
 *getprogname(void);
int heapsort(void *, size_t, size_t,
     int (*)(const void *, const void *));
/*int heapsort_b(void *, size_t, size_t,
     int (^)(const void *, const void *)) __attribute__((visibility("default")));
int mergesort(void *, size_t, size_t,
     int (*)(const void *, const void *));
int mergesort_b(void *, size_t, size_t,
     int (^)(const void *, const void *)) __attribute__((visibility("default")));
void psort(void *, size_t, size_t,
     int (*)(const void *, const void *)) __attribute__((visibility("default")));
void psort_b(void *, size_t, size_t,
     int (^)(const void *, const void *)) __attribute__((visibility("default")));
void psort_r(void *, size_t, size_t, void *,
     int (*)(void *, const void *, const void *)) __attribute__((visibility("default")));
void qsort_b(void *, size_t, size_t,
     int (^)(const void *, const void *)) __attribute__((visibility("default")));*/
void qsort_r(void *, size_t, size_t, void *,
     int (*)(void *, const void *, const void *));
int radixsort(const unsigned char **, int, const unsigned char *,
     unsigned);
void setprogname(const char *);
int sradixsort(const unsigned char **, int, const unsigned char *,
     unsigned);
void sranddev(void);
void srandomdev(void);
void *reallocf(void *, size_t);
long long
  strtoq(const char *, char **, int);
unsigned long long
  strtouq(const char *, char **, int);
extern char *suboptarg;
void *valloc(size_t);

typedef double PLFLT;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;
typedef int8_t int_least8_t;
typedef int16_t int_least16_t;
typedef int32_t int_least32_t;
typedef int64_t int_least64_t;
typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;
typedef uint32_t uint_least32_t;
typedef uint64_t uint_least64_t;
typedef int8_t int_fast8_t;
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef int64_t int_fast64_t;
typedef uint8_t uint_fast8_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
typedef uint64_t uint_fast64_t;
typedef long int intmax_t;
typedef long unsigned int uintmax_t;
typedef uint32_t PLUINT;
typedef int32_t PLINT;
typedef int64_t PLINT64;
typedef PLUINT PLUNICODE;
typedef PLINT PLBOOL;
typedef void* PLPointer;
typedef struct
{
    const char *opt;
    int ( *handler )( const char *, const char *, void * );
    void *client_data;
    void *var;
    long mode;
    const char *syntax;
    const char *desc;
} PLOptionTable;
typedef struct
{
    int type;
    unsigned int state;
    unsigned int keysym;
    unsigned int button;
    PLINT subwindow;
    char string[16];
    int pX, pY;
    PLFLT dX, dY;
    PLFLT wX, wY;
} PLGraphicsIn;
typedef struct
{
    PLFLT dxmi, dxma, dymi, dyma;
    PLFLT wxmi, wxma, wymi, wyma;
} PLWindow;
typedef struct
{
    unsigned int x, y;
    unsigned int width, height;
} PLDisplay;
typedef struct
{
    const PLFLT *f;
    PLINT nx, ny, nz;
} PLfGrid;
typedef struct
{
    PLFLT **f;
    PLINT nx, ny;
} PLfGrid2;
typedef struct
{
    PLFLT *xg, *yg, *zg;
    PLINT nx, ny, nz;
} PLcGrid;
typedef struct
{
    PLFLT **xg, **yg, **zg;
    PLINT nx, ny;
} PLcGrid2;
typedef struct
{
    unsigned char r;
    unsigned char g;
    unsigned char b;
    PLFLT a;
    const char *name;
} PLColor;
typedef struct
{
    PLFLT h;
    PLFLT l;
    PLFLT s;
    PLFLT p;
    PLFLT a;
    int alt_hue_path;
} PLControlPt;
typedef struct
{
    PLINT cmd;
    PLINT result;
} PLBufferingCB;
typedef struct
{
    PLFLT exp_label_disp;
    PLFLT exp_label_pos;
    PLFLT exp_label_just;
} PLLabelDefaults;
typedef struct
{
    PLFLT ( *get )( PLPointer p, PLINT ix, PLINT iy );
    PLFLT ( *set )( PLPointer p, PLINT ix, PLINT iy, PLFLT z );
    PLFLT ( *add )( PLPointer p, PLINT ix, PLINT iy, PLFLT z );
    PLFLT ( *sub )( PLPointer p, PLINT ix, PLINT iy, PLFLT z );
    PLFLT ( *mul )( PLPointer p, PLINT ix, PLINT iy, PLFLT z );
    PLFLT ( *div )( PLPointer p, PLINT ix, PLINT iy, PLFLT z );
    PLINT ( *is_nan )( PLPointer p, PLINT ix, PLINT iy );
    void ( *minmax )( PLPointer p, PLINT nx, PLINT ny, PLFLT *zmim, PLFLT *zmax );
    PLFLT ( *f2eval )( PLINT ix, PLINT iy, PLPointer p );
} plf2ops_t;
typedef plf2ops_t * PLF2OPS;
 void
c_pl_setcontlabelformat( PLINT lexp, PLINT sigdig );
 void
c_pl_setcontlabelparam( PLFLT offset, PLFLT size, PLFLT spacing, PLINT active );
 void
c_pladv( PLINT page );
 void
c_plarc( PLFLT x, PLFLT y, PLFLT a, PLFLT b, PLFLT angle1, PLFLT angle2,
         PLFLT rotate, PLBOOL fill );
 void
c_plaxes( PLFLT x0, PLFLT y0, const char *xopt, PLFLT xtick, PLINT nxsub,
          const char *yopt, PLFLT ytick, PLINT nysub );
 void
c_plbin( PLINT nbin, const PLFLT *x, const PLFLT *y, PLINT opt );
 void
c_plbtime( PLINT *year, PLINT *month, PLINT *day, PLINT *hour, PLINT *min, PLFLT *sec, PLFLT ctime );
 void
c_plbop( void );
 void
c_plbox( const char *xopt, PLFLT xtick, PLINT nxsub,
         const char *yopt, PLFLT ytick, PLINT nysub );
 void
c_plbox3( const char *xopt, const char *xlabel, PLFLT xtick, PLINT nsubx,
          const char *yopt, const char *ylabel, PLFLT ytick, PLINT nsuby,
          const char *zopt, const char *zlabel, PLFLT ztick, PLINT nsubz );
 void
c_plcalc_world( PLFLT rx, PLFLT ry, PLFLT *wx, PLFLT *wy, PLINT *window );
 void
c_plclear( void );
 void
c_plcol0( PLINT icol0 );
 void
c_plcol1( PLFLT col1 );
 void
c_plconfigtime( PLFLT scale, PLFLT offset1, PLFLT offset2, PLINT ccontrol, PLBOOL ifbtime_offset, PLINT year, PLINT month, PLINT day, PLINT hour, PLINT min, PLFLT sec );
 void
c_plcont( const PLFLT * const *f, PLINT nx, PLINT ny, PLINT kx, PLINT lx,
          PLINT ky, PLINT ly, const PLFLT *clevel, PLINT nlevel,
          void ( *pltr )( PLFLT, PLFLT, PLFLT *, PLFLT *, PLPointer ),
          PLPointer pltr_data );
 void
plfcont( PLFLT ( *f2eval )( PLINT, PLINT, PLPointer ),
         PLPointer f2eval_data,
         PLINT nx, PLINT ny, PLINT kx, PLINT lx,
         PLINT ky, PLINT ly, const PLFLT *clevel, PLINT nlevel,
         void ( *pltr )( PLFLT, PLFLT, PLFLT *, PLFLT *, PLPointer ),
         PLPointer pltr_data );
 void
c_plcpstrm( PLINT iplsr, PLBOOL flags );
 void
c_plctime( PLINT year, PLINT month, PLINT day, PLINT hour, PLINT min, PLFLT sec, PLFLT *ctime );
 void
pldid2pc( PLFLT *xmin, PLFLT *ymin, PLFLT *xmax, PLFLT *ymax );
 void
pldip2dc( PLFLT *xmin, PLFLT *ymin, PLFLT *xmax, PLFLT *ymax );
 void
c_plend( void );
 void
c_plend1( void );
 void
c_plenv( PLFLT xmin, PLFLT xmax, PLFLT ymin, PLFLT ymax,
         PLINT just, PLINT axis );
 void
c_plenv0( PLFLT xmin, PLFLT xmax, PLFLT ymin, PLFLT ymax,
          PLINT just, PLINT axis );
 void
c_pleop( void );
 void
c_plerrx( PLINT n, const PLFLT *xmin, const PLFLT *xmax, const PLFLT *y );
 void
c_plerry( PLINT n, const PLFLT *x, const PLFLT *ymin, const PLFLT *ymax );
 void
c_plfamadv( void );
 void
c_plfill( PLINT n, const PLFLT *x, const PLFLT *y );
 void
c_plfill3( PLINT n, const PLFLT *x, const PLFLT *y, const PLFLT *z );
 void
c_plflush( void );
 void
c_plfont( PLINT ifont );
 void
c_plfontld( PLINT fnt );
 void
c_plgchr( PLFLT *p_def, PLFLT *p_ht );
 void
c_plgcol0( PLINT icol0, PLINT *r, PLINT *g, PLINT *b );
 void
c_plgcol0a( PLINT icol0, PLINT *r, PLINT *g, PLINT *b, PLFLT *a );
 void
c_plgcolbg( PLINT *r, PLINT *g, PLINT *b );
 void
c_plgcolbga( PLINT *r, PLINT *g, PLINT *b, PLFLT *a );
 void
c_plgcompression( PLINT *compression );
 void
c_plgdev( char *p_dev );
 void
c_plgdidev( PLFLT *p_mar, PLFLT *p_aspect, PLFLT *p_jx, PLFLT *p_jy );
 void
c_plgdiori( PLFLT *p_rot );
 void
c_plgdiplt( PLFLT *p_xmin, PLFLT *p_ymin, PLFLT *p_xmax, PLFLT *p_ymax );
 PLINT
c_plgdrawmode( void );
 void
c_plgfci( PLUNICODE *pfci );
 void
c_plgfam( PLINT *p_fam, PLINT *p_num, PLINT *p_bmax );
 void
c_plgfnam( char *fnam );
 void
c_plgfont( PLINT *p_family, PLINT *p_style, PLINT *p_weight );
 void
c_plglevel( PLINT *p_level );
 void
c_plgpage( PLFLT *p_xp, PLFLT *p_yp,
           PLINT *p_xleng, PLINT *p_yleng, PLINT *p_xoff, PLINT *p_yoff );
 void
c_plgra( void );
 void
c_plgradient( PLINT n, const PLFLT *x, const PLFLT *y, PLFLT angle );
 void
c_plgriddata( const PLFLT *x, const PLFLT *y, const PLFLT *z, PLINT npts,
              const PLFLT *xg, PLINT nptsx, const PLFLT *yg, PLINT nptsy,
              PLFLT **zg, PLINT type, PLFLT data );
 void
plfgriddata( const PLFLT *x, const PLFLT *y, const PLFLT *z, PLINT npts,
             const PLFLT *xg, PLINT nptsx, const PLFLT *yg, PLINT nptsy,
             PLF2OPS zops, PLPointer zgp, PLINT type, PLFLT data );
 void
c_plgspa( PLFLT *xmin, PLFLT *xmax, PLFLT *ymin, PLFLT *ymax );
 void
c_plgstrm( PLINT *p_strm );
 void
c_plgver( char *p_ver );
 void
c_plgvpd( PLFLT *p_xmin, PLFLT *p_xmax, PLFLT *p_ymin, PLFLT *p_ymax );
 void
c_plgvpw( PLFLT *p_xmin, PLFLT *p_xmax, PLFLT *p_ymin, PLFLT *p_ymax );
 void
c_plgxax( PLINT *p_digmax, PLINT *p_digits );
 void
c_plgyax( PLINT *p_digmax, PLINT *p_digits );
 void
c_plgzax( PLINT *p_digmax, PLINT *p_digits );
 void
c_plhist( PLINT n, const PLFLT *data, PLFLT datmin, PLFLT datmax,
          PLINT nbin, PLINT opt );
 void
c_plhlsrgb( PLFLT h, PLFLT l, PLFLT s, PLFLT *p_r, PLFLT *p_g, PLFLT *p_b );
 void
c_plinit( void );
 void
c_pljoin( PLFLT x1, PLFLT y1, PLFLT x2, PLFLT y2 );


 void
c_pllab( const char *xlabel, const char *ylabel, const char *tlabel );
 void
c_pllegend( PLFLT *p_legend_width, PLFLT *p_legend_height,
            PLINT opt, PLINT position, PLFLT x, PLFLT y, PLFLT plot_width,
            PLINT bg_color, PLINT bb_color, PLINT bb_style,
            PLINT nrow, PLINT ncolumn,
            PLINT nlegend, const PLINT *opt_array,
            PLFLT text_offset, PLFLT text_scale, PLFLT text_spacing,
            PLFLT text_justification,
            const PLINT *text_colors, const char * const *text,
            const PLINT *box_colors, const PLINT *box_patterns,
            const PLFLT *box_scales, const PLFLT *box_line_widths,
            const PLINT *line_colors, const PLINT *line_styles,
            const PLFLT *line_widths,
            const PLINT *symbol_colors, const PLFLT *symbol_scales,
            const PLINT *symbol_numbers, const char * const *symbols );
 void
c_plcolorbar( PLFLT *p_colorbar_width, PLFLT *p_colorbar_height,
              PLINT opt, PLINT position, PLFLT x, PLFLT y,
              PLFLT x_length, PLFLT y_length,
              PLINT bg_color, PLINT bb_color, PLINT bb_style,
              PLFLT low_cap_color, PLFLT high_cap_color,
              PLINT cont_color, PLFLT cont_width,
              PLINT n_labels, const PLINT *label_opts, const char * const *label,
              PLINT n_axes, const char * const * axis_opts,
              const PLFLT *ticks, const PLINT *sub_ticks,
              const PLINT *n_values, const PLFLT * const *values );
 void
c_pllightsource( PLFLT x, PLFLT y, PLFLT z );
 void
c_plline( PLINT n, const PLFLT *x, const PLFLT *y );
 void
c_plline3( PLINT n, const PLFLT *x, const PLFLT *y, const PLFLT *z );
 void
c_pllsty( PLINT lin );
 void
c_plmap( void ( *mapform )( PLINT, PLFLT *, PLFLT * ), const char *type,
         PLFLT minlong, PLFLT maxlong, PLFLT minlat, PLFLT maxlat );
 void
c_plmeridians( void ( *mapform )( PLINT, PLFLT *, PLFLT * ),
               PLFLT dlong, PLFLT dlat,
               PLFLT minlong, PLFLT maxlong, PLFLT minlat, PLFLT maxlat );
 void
c_plmesh( const PLFLT *x, const PLFLT *y, const PLFLT * const *z, PLINT nx, PLINT ny, PLINT opt );
 void
plfmesh( const PLFLT *x, const PLFLT *y, PLF2OPS zops, PLPointer zp,
         PLINT nx, PLINT ny, PLINT opt );
 void
c_plmeshc( const PLFLT *x, const PLFLT *y, const PLFLT * const *z, PLINT nx, PLINT ny, PLINT opt,
           const PLFLT *clevel, PLINT nlevel );
 void
plfmeshc( const PLFLT *x, const PLFLT *y, PLF2OPS zops, PLPointer zp,
          PLINT nx, PLINT ny, PLINT opt, const PLFLT *clevel, PLINT nlevel );
 void
c_plmkstrm( PLINT *p_strm );
 void
c_plmtex( const char *side, PLFLT disp, PLFLT pos, PLFLT just,
          const char *text );
 void
c_plmtex3( const char *side, PLFLT disp, PLFLT pos, PLFLT just,
           const char *text );
 void
c_plot3d( const PLFLT *x, const PLFLT *y, const PLFLT * const *z,
          PLINT nx, PLINT ny, PLINT opt, PLBOOL side );
 void
plfplot3d( const PLFLT *x, const PLFLT *y, PLF2OPS zops, PLPointer zp,
           PLINT nx, PLINT ny, PLINT opt, PLBOOL side );
 void
c_plot3dc( const PLFLT *x, const PLFLT *y, const PLFLT * const *z,
           PLINT nx, PLINT ny, PLINT opt,
           const PLFLT *clevel, PLINT nlevel );
 void
plfplot3dc( const PLFLT *x, const PLFLT *y, PLF2OPS zops, PLPointer zp,
            PLINT nx, PLINT ny, PLINT opt, const PLFLT *clevel, PLINT nlevel );
 void
c_plot3dcl( const PLFLT *x, const PLFLT *y, const PLFLT * const *z,
            PLINT nx, PLINT ny, PLINT opt,
            const PLFLT *clevel, PLINT nlevel,
            PLINT ixstart, PLINT ixn, const PLINT *indexymin, const PLINT *indexymax );
 void
plfplot3dcl( const PLFLT *x, const PLFLT *y, PLF2OPS zops, PLPointer zp,
             PLINT nx, PLINT ny, PLINT opt,
             const PLFLT *clevel, PLINT nlevel,
             PLINT ixstart, PLINT ixn, const PLINT *indexymin, const PLINT *indexymax );
 void
c_plpat( PLINT nlin, const PLINT *inc, const PLINT *del );
 void
c_plpath( PLINT n, PLFLT x1, PLFLT y1, PLFLT x2, PLFLT y2 );
 void
c_plpoin( PLINT n, const PLFLT *x, const PLFLT *y, PLINT code );
 void
c_plpoin3( PLINT n, const PLFLT *x, const PLFLT *y, const PLFLT *z, PLINT code );
 void
c_plpoly3( PLINT n, const PLFLT *x, const PLFLT *y, const PLFLT *z, const PLBOOL *draw, PLBOOL ifcc );
 void
c_plprec( PLINT setp, PLINT prec );
 void
c_plpsty( PLINT patt );
 void
c_plptex( PLFLT x, PLFLT y, PLFLT dx, PLFLT dy, PLFLT just, const char *text );
 void
c_plptex3( PLFLT wx, PLFLT wy, PLFLT wz, PLFLT dx, PLFLT dy, PLFLT dz,
           PLFLT sx, PLFLT sy, PLFLT sz, PLFLT just, const char *text );
 PLFLT
c_plrandd( void );
 void
c_plreplot( void );
 void
c_plrgbhls( PLFLT r, PLFLT g, PLFLT b, PLFLT *p_h, PLFLT *p_l, PLFLT *p_s );
 void
c_plschr( PLFLT def, PLFLT scale );
 void
c_plscmap0( const PLINT *r, const PLINT *g, const PLINT *b, PLINT ncol0 );
 void
c_plscmap0a( const PLINT *r, const PLINT *g, const PLINT *b, const PLFLT *a, PLINT ncol0 );
 void
c_plscmap0n( PLINT ncol0 );
 void
c_plscmap1( const PLINT *r, const PLINT *g, const PLINT *b, PLINT ncol1 );
 void
c_plscmap1a( const PLINT *r, const PLINT *g, const PLINT *b, const PLFLT *a, PLINT ncol1 );
 void
c_plscmap1l( PLBOOL itype, PLINT npts, const PLFLT *intensity,
             const PLFLT *coord1, const PLFLT *coord2, const PLFLT *coord3, const PLBOOL *alt_hue_path );
 void
c_plscmap1la( PLBOOL itype, PLINT npts, const PLFLT *intensity,
              const PLFLT *coord1, const PLFLT *coord2, const PLFLT *coord3, const PLFLT *a, const PLBOOL *alt_hue_path );
 void
c_plscmap1n( PLINT ncol1 );
 void
c_plscmap1_range( PLFLT min_color, PLFLT max_color );
 void
c_plgcmap1_range( PLFLT *min_color, PLFLT *max_color );
 void
c_plscol0( PLINT icol0, PLINT r, PLINT g, PLINT b );
 void
c_plscol0a( PLINT icol0, PLINT r, PLINT g, PLINT b, PLFLT a );
 void
c_plscolbg( PLINT r, PLINT g, PLINT b );
 void
c_plscolbga( PLINT r, PLINT g, PLINT b, PLFLT a );
 void
c_plscolor( PLINT color );
 void
c_plscompression( PLINT compression );
 void
c_plsdev( const char *devname );
 void
c_plsdidev( PLFLT mar, PLFLT aspect, PLFLT jx, PLFLT jy );
 void
c_plsdimap( PLINT dimxmin, PLINT dimxmax, PLINT dimymin, PLINT dimymax,
            PLFLT dimxpmm, PLFLT dimypmm );
 void
c_plsdiori( PLFLT rot );
 void
c_plsdiplt( PLFLT xmin, PLFLT ymin, PLFLT xmax, PLFLT ymax );
 void
c_plsdiplz( PLFLT xmin, PLFLT ymin, PLFLT xmax, PLFLT ymax );
 void
c_plseed( unsigned int s );
 void
c_plsesc( char esc );
 void
c_plsfam( PLINT fam, PLINT num, PLINT bmax );
 void
c_plsfci( PLUNICODE fci );
 void
c_plsfnam( const char *fnam );
 void
c_plsfont( PLINT family, PLINT style, PLINT weight );
 void
c_plshade( const PLFLT * const *a, PLINT nx, PLINT ny, PLINT ( *defined )( PLFLT, PLFLT ),
           PLFLT left, PLFLT right, PLFLT bottom, PLFLT top,
           PLFLT shade_min, PLFLT shade_max,
           PLINT sh_cmap, PLFLT sh_color, PLFLT sh_width,
           PLINT min_color, PLFLT min_width,
           PLINT max_color, PLFLT max_width,
           void ( *fill )( PLINT, const PLFLT *, const PLFLT * ), PLBOOL rectangular,
           void ( *pltr )( PLFLT, PLFLT, PLFLT *, PLFLT *, PLPointer ),
           PLPointer pltr_data );
 void
c_plshade1( const PLFLT *a, PLINT nx, PLINT ny, PLINT ( *defined )( PLFLT, PLFLT ),
            PLFLT left, PLFLT right, PLFLT bottom, PLFLT top,
            PLFLT shade_min, PLFLT shade_max,
            PLINT sh_cmap, PLFLT sh_color, PLFLT sh_width,
            PLINT min_color, PLFLT min_width,
            PLINT max_color, PLFLT max_width,
            void ( *fill )( const PLINT, const PLFLT *, const PLFLT * ), PLBOOL rectangular,
            void ( *pltr )( PLFLT, PLFLT, PLFLT *, PLFLT *, PLPointer ),
            PLPointer pltr_data );
 void
c_plshades( const PLFLT * const *a, PLINT nx, PLINT ny, PLINT ( *defined )( PLFLT, PLFLT ),
            PLFLT xmin, PLFLT xmax, PLFLT ymin, PLFLT ymax,
            const PLFLT *clevel, PLINT nlevel, PLFLT fill_width,
            PLINT cont_color, PLFLT cont_width,
            void ( *fill )( PLINT, const PLFLT *, const PLFLT * ), PLBOOL rectangular,
            void ( *pltr )( PLFLT, PLFLT, PLFLT *, PLFLT *, PLPointer ),
            PLPointer pltr_data );
 void
plfshades( PLF2OPS zops, PLPointer zp, PLINT nx, PLINT ny,
           PLINT ( *defined )( PLFLT, PLFLT ),
           PLFLT xmin, PLFLT xmax, PLFLT ymin, PLFLT ymax,
           const PLFLT *clevel, PLINT nlevel, PLFLT fill_width,
           PLINT cont_color, PLFLT cont_width,
           void ( *fill )( PLINT, const PLFLT *, const PLFLT * ), PLINT rectangular,
           void ( *pltr )( PLFLT, PLFLT, PLFLT *, PLFLT *, PLPointer ),
           PLPointer pltr_data );
 void
plfshade( PLFLT ( *f2eval )( PLINT, PLINT, PLPointer ),
          PLPointer f2eval_data,
          PLFLT ( *c2eval )( PLINT, PLINT, PLPointer ),
          PLPointer c2eval_data,
          PLINT nx, PLINT ny,
          PLFLT left, PLFLT right, PLFLT bottom, PLFLT top,
          PLFLT shade_min, PLFLT shade_max,
          PLINT sh_cmap, PLFLT sh_color, PLFLT sh_width,
          PLINT min_color, PLFLT min_width,
          PLINT max_color, PLFLT max_width,
          void ( *fill )( PLINT, const PLFLT *, const PLFLT * ), PLBOOL rectangular,
          void ( *pltr )( PLFLT, PLFLT, PLFLT *, PLFLT *, PLPointer ),
          PLPointer pltr_data );
 void
plfshade1( PLF2OPS zops, PLPointer zp, PLINT nx, PLINT ny,
           PLINT ( *defined )( PLFLT, PLFLT ),
           PLFLT xmin, PLFLT xmax, PLFLT ymin, PLFLT ymax,
           PLFLT shade_min, PLFLT shade_max,
           PLINT sh_cmap, PLFLT sh_color, PLFLT sh_width,
           PLINT min_color, PLFLT min_width,
           PLINT max_color, PLFLT max_width,
           void ( *fill )( PLINT, const PLFLT *, const PLFLT * ), PLINT rectangular,
           void ( *pltr )( PLFLT, PLFLT, PLFLT *, PLFLT *, PLPointer ),
           PLPointer pltr_data );
 void
c_plslabelfunc( void ( *label_func )( PLINT, PLFLT, char *, PLINT, PLPointer ),
                PLPointer label_data );
 void
c_plsmaj( PLFLT def, PLFLT scale );
 void
c_plsmem( PLINT maxx, PLINT maxy, void *plotmem );
 void
c_plsmema( PLINT maxx, PLINT maxy, void *plotmem );
 void
c_plsmin( PLFLT def, PLFLT scale );
 void
c_plsdrawmode( PLINT mode );
 void
c_plsori( PLINT ori );
 void
c_plspage( PLFLT xp, PLFLT yp, PLINT xleng, PLINT yleng,
           PLINT xoff, PLINT yoff );
 void
c_plspal0( const char *filename );
 void
c_plspal1( const char *filename, PLBOOL interpolate );
 void
c_plspause( PLBOOL pause );
 void
c_plsstrm( PLINT strm );
 void
c_plssub( PLINT nx, PLINT ny );
 void
c_plssym( PLFLT def, PLFLT scale );
 void
c_plstar( PLINT nx, PLINT ny );
 void
c_plstart( const char *devname, PLINT nx, PLINT ny );
 void
c_plstransform( void ( *coordinate_transform )( PLFLT, PLFLT, PLFLT*, PLFLT*, PLPointer ), PLPointer coordinate_transform_data );
 void
c_plstring( PLINT n, const PLFLT *x, const PLFLT *y, const char *string );
 void
c_plstring3( PLINT n, const PLFLT *x, const PLFLT *y, const PLFLT *z, const char *string );
 void
c_plstripa( PLINT id, PLINT pen, PLFLT x, PLFLT y );
 void
c_plstripc( PLINT *id, const char *xspec, const char *yspec,
            PLFLT xmin, PLFLT xmax, PLFLT xjump, PLFLT ymin, PLFLT ymax,
            PLFLT xlpos, PLFLT ylpos,
            PLBOOL y_ascl, PLBOOL acc,
            PLINT colbox, PLINT collab,
            const PLINT colline[], const PLINT styline[], const char *legline[],
            const char *labx, const char *laby, const char *labtop );
 void
c_plstripd( PLINT id );
 void
c_plimagefr( const PLFLT * const *idata, PLINT nx, PLINT ny,
             PLFLT xmin, PLFLT xmax, PLFLT ymin, PLFLT ymax, PLFLT zmin, PLFLT zmax,
             PLFLT valuemin, PLFLT valuemax,
             void ( *pltr )( PLFLT, PLFLT, PLFLT *, PLFLT *, PLPointer ),
             PLPointer pltr_data );
 void
plfimagefr( PLF2OPS idataops, PLPointer idatap, PLINT nx, PLINT ny,
            PLFLT xmin, PLFLT xmax, PLFLT ymin, PLFLT ymax, PLFLT zmin, PLFLT zmax,
            PLFLT valuemin, PLFLT valuemax,
            void ( *pltr )( PLFLT, PLFLT, PLFLT *, PLFLT *, PLPointer ),
            PLPointer pltr_data );
 void
c_plimage( const PLFLT * const *idata, PLINT nx, PLINT ny,
           PLFLT xmin, PLFLT xmax, PLFLT ymin, PLFLT ymax, PLFLT zmin, PLFLT zmax,
           PLFLT Dxmin, PLFLT Dxmax, PLFLT Dymin, PLFLT Dymax );
 void
plfimage( PLF2OPS idataops, PLPointer idatap, PLINT nx, PLINT ny,
          PLFLT xmin, PLFLT xmax, PLFLT ymin, PLFLT ymax, PLFLT zmin, PLFLT zmax,
          PLFLT Dxmin, PLFLT Dxmax, PLFLT Dymin, PLFLT Dymax );
 void
c_plstyl( PLINT nms, const PLINT *mark, const PLINT *space );
 void
c_plsurf3d( const PLFLT *x, const PLFLT *y, const PLFLT * const *z, PLINT nx, PLINT ny,
            PLINT opt, const PLFLT *clevel, PLINT nlevel );
 void
plfsurf3d( const PLFLT *x, const PLFLT *y, PLF2OPS zops, PLPointer zp,
           PLINT nx, PLINT ny, PLINT opt, const PLFLT *clevel, PLINT nlevel );
 void
c_plsurf3dl( const PLFLT *x, const PLFLT *y, const PLFLT * const *z, PLINT nx, PLINT ny,
             PLINT opt, const PLFLT *clevel, PLINT nlevel,
             PLINT ixstart, PLINT ixn, const PLINT *indexymin, const PLINT *indexymax );
 void
plfsurf3dl( const PLFLT *x, const PLFLT *y, PLF2OPS zops, PLPointer zp, PLINT nx, PLINT ny,
            PLINT opt, const PLFLT *clevel, PLINT nlevel,
            PLINT ixstart, PLINT ixn, const PLINT *indexymin, const PLINT * indexymax );
 void
c_plsvect( const PLFLT *arrowx, const PLFLT *arrowy, PLINT npts, PLBOOL fill );
 void
c_plsvpa( PLFLT xmin, PLFLT xmax, PLFLT ymin, PLFLT ymax );
 void
c_plsxax( PLINT digmax, PLINT digits );
 void
plsxwin( PLINT window_id );
 void
c_plsyax( PLINT digmax, PLINT digits );
 void
c_plsym( PLINT n, const PLFLT *x, const PLFLT *y, PLINT code );
 void
c_plszax( PLINT digmax, PLINT digits );
 void
c_pltext( void );
 void
c_pltimefmt( const char *fmt );
 void
c_plvasp( PLFLT aspect );
 void
c_plvect( const PLFLT * const *u, const PLFLT * const *v, PLINT nx, PLINT ny, PLFLT scale,
          void ( *pltr )( PLFLT, PLFLT, PLFLT *, PLFLT *, PLPointer ),
          PLPointer pltr_data );
 void
plfvect( PLFLT ( *getuv )( PLINT, PLINT, PLPointer ),
         PLPointer up, PLPointer vp,
         PLINT nx, PLINT ny, PLFLT scale,
         void ( *pltr )( PLFLT, PLFLT, PLFLT *, PLFLT *, PLPointer ),
         PLPointer pltr_data );
 void
c_plvpas( PLFLT xmin, PLFLT xmax, PLFLT ymin, PLFLT ymax, PLFLT aspect );
 void
c_plvpor( PLFLT xmin, PLFLT xmax, PLFLT ymin, PLFLT ymax );
 void
c_plvsta( void );
 void
c_plw3d( PLFLT basex, PLFLT basey, PLFLT height, PLFLT xmin0,
         PLFLT xmax0, PLFLT ymin0, PLFLT ymax0, PLFLT zmin0,
         PLFLT zmax0, PLFLT alt, PLFLT az );
 void
c_plwid( PLINT width );
 void
c_plwidth( PLFLT width );
 void
c_plwind( PLFLT xmin, PLFLT xmax, PLFLT ymin, PLFLT ymax );
 void
c_plxormod( PLBOOL mode, PLBOOL *status );
 void
plgFileDevs( const char ***p_menustr, const char ***p_devname, int *p_ndev );
 void
plgDevs( const char ***p_menustr, const char ***p_devname, int *p_ndev );
 void
plsKeyEH( void ( *KeyEH )( PLGraphicsIn *, void *, int * ), void *KeyEH_data );
 void
plsButtonEH( void ( *ButtonEH )( PLGraphicsIn *, void *, int * ),
             void *ButtonEH_data );
 void
plsbopH( void ( *handler )( void *, int * ), void *handler_data );
 void
plseopH( void ( *handler )( void *, int * ), void *handler_data );
 void
plsError( PLINT *errcode, char *errmsg );
 void
plsexit( int ( *handler )( const char * ) );
 void
plsabort( void ( *handler )( const char * ) );
 void
pltr0( PLFLT x, PLFLT y, PLFLT *tx, PLFLT *ty, PLPointer pltr_data );
 void
pltr1( PLFLT x, PLFLT y, PLFLT *tx, PLFLT *ty, PLPointer pltr_data );
 void
pltr2( PLFLT x, PLFLT y, PLFLT *tx, PLFLT *ty, PLPointer pltr_data );
 void
pltr2p( PLFLT x, PLFLT y, PLFLT *tx, PLFLT *ty, PLPointer pltr_data );
 void
pltr2f( PLFLT x, PLFLT y, PLFLT *tx, PLFLT *ty, void *pltr_data );
 PLF2OPS
plf2ops_c( void );
 PLF2OPS
plf2ops_grid_c( void );
 PLF2OPS
plf2ops_grid_row_major( void );
 PLF2OPS
plf2ops_grid_col_major( void );
 PLFLT
plf2eval1( PLINT ix, PLINT iy, PLPointer plf2eval_data );
 PLFLT
plf2eval2( PLINT ix, PLINT iy, PLPointer plf2eval_data );
 PLFLT
plf2eval( PLINT ix, PLINT iy, PLPointer plf2eval_data );
 PLFLT
plf2evalr( PLINT ix, PLINT iy, PLPointer plf2eval_data );
 void
plClearOpts( void );
 void
plResetOpts( void );
 int
plMergeOpts( PLOptionTable *options, const char *name, const char **notes );
 void
plSetUsage( const char *program_string, const char *usage_string );
 int
c_plsetopt( const char *opt, const char *optarg );
 int
c_plparseopts( int *p_argc, const char **argv, PLINT mode );
 void
plOptUsage( void );
 void
plgfile( FILE **p_file );
 void
plsfile( FILE *file );
 void
plgesc( char *p_esc );
 void
pl_cmd( PLINT op, void *ptr );
 int
plFindName( char *p );
 char *
plFindCommand( const char *fn );
 void
plGetName( const char *dir, const char *subdir, const char *filename, char **filespec );
 PLINT
plGetInt( const char *s );
 PLFLT
plGetFlt( const char *s );
 void
plAlloc2dGrid( PLFLT ***f, PLINT nx, PLINT ny );
 void
plFree2dGrid( PLFLT **f, PLINT nx, PLINT ny );
 void
plMinMax2dGrid( const PLFLT * const *f, PLINT nx, PLINT ny, PLFLT *fmax, PLFLT *fmin );
 int
plGetCursor( PLGraphicsIn *gin );
 int
plTranslateCursor( PLGraphicsIn *gin );

static const PLINT PLESC_DOUBLEBUFFERING_ENABLE = 1;
static const PLINT PLESC_DOUBLEBUFFERING_DISABLE = 2;
static const PLINT PLESC_DOUBLEBUFFERING_QUERY = 3;

static const PLINT PLESC_SET_RGB = 1;
static const PLINT PLESC_ALLOC_NCOL = 2;
static const PLINT PLESC_SET_LPB = 3;
static const PLINT PLESC_EXPOSE = 4;
static const PLINT PLESC_RESIZE = 5;
static const PLINT PLESC_REDRAW = 6;
static const PLINT PLESC_TEXT = 7;
static const PLINT PLESC_GRAPH = 8;
static const PLINT PLESC_FILL = 9;
static const PLINT PLESC_DI = 10;
static const PLINT PLESC_FLUSH = 11;
static const PLINT PLESC_EH = 12;
static const PLINT PLESC_GETC = 13;
static const PLINT PLESC_SWIN = 14;
static const PLINT PLESC_DOUBLEBUFFERING = 15;
static const PLINT PLESC_XORMOD = 16;
static const PLINT PLESC_SET_COMPRESSION = 17;
static const PLINT PLESC_CLEAR = 18;
static const PLINT PLESC_DASH = 19;
static const PLINT PLESC_HAS_TEXT = 20;
static const PLINT PLESC_IMAGE = 21;
static const PLINT PLESC_IMAGEOPS = 22;
static const PLINT PLESC_PL2DEVCOL = 23;
static const PLINT PLESC_DEV2PLCOL = 24;
static const PLINT PLESC_SETBGFG = 25;
static const PLINT PLESC_DEVINIT = 26;
static const PLINT PLESC_GETBACKEND = 27;
static const PLINT PLESC_BEGIN_TEXT = 28;
static const PLINT PLESC_TEXT_CHAR = 29;
static const PLINT PLESC_CONTROL_CHAR = 30;
static const PLINT PLESC_END_TEXT = 31;
static const PLINT PLESC_START_RASTERIZE = 32;
static const PLINT PLESC_END_RASTERIZE = 33;
static const PLINT PLESC_ARC = 34;
static const PLINT PLESC_GRADIENT = 35;
static const PLINT PLESC_MODESET = 36;
static const PLINT PLESC_MODEGET = 37;

static const PLINT PL_HIST_NOSCALING = 1;
static const PLINT PL_HIST_IGNORE_OUTLIERS = 2;
static const PLINT PL_HIST_NOEXPAND = 8;
static const PLINT PL_HIST_NOEMPTY = 16;
static const PLINT PL_HIST_DEFAULT = 0;
]]
