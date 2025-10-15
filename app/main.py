from tkinter.messagebox import RETRY

from aiohttp import web

routes = web.RouteTableDef()

@routes.get('/')
async def hello_mentor(request):
    return web.Response(text="Hello, mentor")


def create_app():
    app = web.Application()
    app.add_routes(routes)
    return app


if __name__ == '__main__':
    web.run_app(create_app())